//
//  AppResponse.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public struct AppResponse<T>: AppicationResponse {
    public let code: HTTPCode
    public let result: Result<T, Error>
}
