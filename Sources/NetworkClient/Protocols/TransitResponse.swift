//
//  TransitResponse.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public protocol TransitResponse {
    var code: Int! { get set }
    var result: Result<Data?, Error>! { get set }
}
