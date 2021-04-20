//
//  File.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation
import Decorator

public protocol HTTPClient: class {
    func send<T: EntryPointProtocol>(item: SendItem, transit: T) where T.EntryPointInput == ReceiveItem
}
