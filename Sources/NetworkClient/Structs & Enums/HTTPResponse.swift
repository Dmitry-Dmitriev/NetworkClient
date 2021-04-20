//
//  File.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public struct HTTPResponse: TransitResponse {
    public var code: Int!
    public var result: Result<Data?, Error>!
}
