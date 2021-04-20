//
//  Final.swift
//  
//
//  Created by dmitry on 21.04.2021.
//

import Foundation
import SwiftParser
import Decorator

public final class Final<T: Parsable>: ParameterizedDecoratorProtocol {
    
    public init(completion: @escaping (Result<T.ParseType, Error>) -> Void) {
        self.onComplete = completion
    }
    
    public var input: AppResponse<T.ParseType>!
    public var output: Result<T.ParseType, Error>!
    
    public var onComplete: (Result<T.ParseType, Error>) -> Void = { _ in }
    
    public func execute() {
        output = input.result
        onComplete(output)
    }
}
