//
//  ReceiveHandler.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation
import Decorator

public final class ReceiveHandler: ParameterizedDecoratorProtocol {
    public init() { }
    
    public var input: ReceiveItem!
    public var output: TransitResponse!
    
    public var onComplete: (TransitResponse) -> Void = { _ in }
    
    public func execute() {
        
        output = HTTPResponse(code: code,
                             result: result)
        onComplete(output)
    }
    
    private var code: Int {
        guard let response = input.response as? HTTPURLResponse else {
            return -1
        }
        
        return response.statusCode
    }
    
    private var result: Result<Data?, Error> {
        
        if let error = input.error {
            return .failure(error)
        }
        
        return .success(input.data)
    }
}
