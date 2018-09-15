//
//  RequestProtocol.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var jsonContentType = "application/json"
}

enum RequestType {
    case post, get, put, patch, delete, head, trace, connect
    var description: String {
        return String(describing: self).uppercased()
    }
}

enum RequestContentType {
    case json
    var description: String {
        switch self {
        case .json:
            return Constants.jsonContentType
        }
    }
}

protocol RequestProtocol {
    var path: String { get }
    var extraHeaders: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var requestType: RequestType { get }
    var contentType: RequestContentType { get }
}
