//
//  IceCreamLoadingError.swift
//  IceCreamNetwork
//
//  Created by Pavel Vaitsikhouski on 7/13/20.
//  Copyright © 2020 vpaveldm. All rights reserved.
//

import Foundation

public enum IceCreamLoadingError: Error, LocalizedError {
    case defaultError
    
    public var errorDescription: String? {
        switch self {
        case .defaultError:
            return "Ошибка при загрузке. Попробуйте еще раз, пожалуйста"
        }
    }
}
