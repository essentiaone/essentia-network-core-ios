//
//  NetworkManagerInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public protocol NetworkManagerInterface {
    
    func makeRequest<SuccessModel: Decodable> (
        _ request: RequestProtocol,
        result: @escaping (Result<SuccessModel>) -> Void
    )
}
