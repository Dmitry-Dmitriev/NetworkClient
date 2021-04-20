//
//  SendItem.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation

public protocol SendItem {
    var request: URLRequest { get }
}
