//
//  RxNetworkManager.swift
//  essentia-network-core-ios
//
//  Created by Pavlo Boiko on 7/18/19.
//  Copyright © 2019 Essentia-One. All rights reserved.
//

import Foundation
import RxSwift

public class RxNetworkManager: RxNetworkManagerInterface {
    private var urlSession: URLSession
    private var serverUrl: String
    
    init(url: String) {
        urlSession = URLSession.defaultNetworkSession
        self.serverUrl = url
    }
    
    public func request<SuccessModel: Decodable>(_ request: RequestProtocol) -> Observable<SuccessModel> {
        return Observable.create({ (observer) -> Disposable in
            
            return Disposables.create()
        })
    }
    
    public func requestData(_ request: RequestProtocol) -> Observable<Data> {
        return Observable.create({ (observer) -> Disposable in
            
            return Disposables.create()
        })
    }
}
