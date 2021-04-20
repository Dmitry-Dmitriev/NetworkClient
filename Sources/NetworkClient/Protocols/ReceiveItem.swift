//
//  ReceiveItem.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public protocol ReceiveItem {
    var data: Data? { get set }
    var error: Error? { get set }
    var response: URLResponse? { get set }
}
