//
//  WWWClient.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation
import Decorator

public class WWWClient: HTTPClient {
    public init() { }
    
    public func send<T: EntryPointProtocol>(item: SendItem, transit: T) where T.EntryPointInput == ReceiveItem
    {
        URLSession.shared.dataTask(with: item.request) { (data, response, err) in
                 
            transit.input = RawResponse(data: data, error: err, response: response)
            transit.execute()
        }
    }
}
