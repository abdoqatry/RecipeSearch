//
//  CustomNetworkError.swift
//  RecipeSearch
//
//  Created by Admin on 17/11/2022.
//

import Foundation

enum CustomNetworkError: Error, LocalizedError {
    
    init(error: Error) {
        self = .unknowen(error.asAFError?.localizedDescription)
    }
    
    case canNotMapRequest
    case canNotDecodeObject
    case unknowen(String?)
    case generic
    
    public var localizedDescription: String {
        switch self {
        case .canNotMapRequest:
            return Localization.string(for: .errorMessageCanNotSendRequest)
        case .canNotDecodeObject:
            return Localization.string(for: .errorMessageCanNotReadData)
        case .generic:
            return Localization.string(for: .errorMessageGeneric)
        case .unknowen(let message):
            return message ?? Localization.string(for: .errorMessageGeneric)
            
        }
    }

}

