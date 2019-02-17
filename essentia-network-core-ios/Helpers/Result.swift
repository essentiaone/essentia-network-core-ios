//
//  Result.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public enum NetworkResult<Object: Decodable> {
    case success(Object)
    case failure(EssentiaNetworkError)
}
