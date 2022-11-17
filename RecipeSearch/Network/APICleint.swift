//
//  APICleint.swift
//  RecipeSearch
//
//  Created by Admin on 17/11/2022.
//


import Alamofire

class APICleint {
    
    static let shared = APICleint()
    
    private init() {}
}

extension APICleint: APICleintProtocol {
    
    func send<ResponsType>(request: RequestProtocol, compeletion: @escaping (Result<ResponsType, CustomNetworkError>) -> Void) where ResponsType : Model {
        Session.default.request(request).validate().responseObject(compeletion: compeletion)
    }
}
