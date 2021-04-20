//
//  AppicationResponse.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public protocol AppicationResponse {
    associatedtype T
    
    var code: HTTPCode { get }
    var result: Result<T, Error> { get }
}
