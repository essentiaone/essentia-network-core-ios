//
//  NetworkManager.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public class NetworkManager: NetworkManagerInterface {
    private var urlSession: URLSession
    
    public init(_ serverUrl: String) {
        self.serverUrl = serverUrl
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        config.allowsCellularAccess = true
        if #available(iOS 11, *) {
            config.waitsForConnectivity = true
        }
        urlSession = URLSession(configuration: config)
    }
    
    let serverUrl: String
    
    public func makeAsyncRequest<SuccessModel: Decodable> (
            _ request: RequestProtocol,
            result: @escaping (NetworkResult<SuccessModel>) -> Void
        ) {
        DispatchQueue.global().async {
            self.makeSyncRequest(request, result: result)
        }
    }
    
    public func makeSyncRequest<SuccessModel: Decodable> (
        _ request: RequestProtocol,
        result: @escaping (NetworkResult<SuccessModel>) -> Void
        ) {
        let requestBuilder = RequestBuilder(request: request)
        let urlRequest = requestBuilder.build(for: serverUrl)
        switch request.contentType {
        case .json:
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                self.handleResponse(response: (data, error), result: result)
                }.resume()
        }
        Logger.shared.logEvent(.httpRequest(urlRequest))
    }
    
    private func handleResponse<SuccessModel: Decodable> (
            response: (Data?, Error?),
            result: @escaping (NetworkResult<SuccessModel>) -> Void
        ) {
        DispatchQueue.main.async {
            guard let data = response.0 else {
                guard let error = response.1 else {
                    result(.failure(.unknownError))
                    return
                }
                result(.failure(EssentiaNetworkError.defaultError(error)))
                return
            }
            guard let object = try? JSONDecoder().decode(SuccessModel.self, from: data) else {
                Logger.shared.logEvent(.message(.warning, String(data: data, encoding: .utf8)))
                self.handleError(response: data, result: result)
                return
            }
            result(.success(object))
        }
    }
    
    private func handleError<SuccessModel: Decodable> (
            response: Data,
            result: @escaping (NetworkResult<SuccessModel>) -> Void
        ) {
        let decoder = JSONDecoder()
        guard let failedObject = try? decoder.decode(EssentiaNetworkError.self, from: response) else {
            Logger.shared.logEvent(.message(.error, String(data: response, encoding: .utf8)))
            result(.failure(.unknownError))
            return
        }
        Logger.shared.logEvent(.message(.error, String(describing: failedObject)))
        result(.failure(failedObject))
    }
}
