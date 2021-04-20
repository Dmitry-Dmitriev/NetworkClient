//
//  RawResponse.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public struct RawResponse: ReceiveItem {
    public var data: Data?
    public var error: Error?
    public var response: URLResponse?
}
