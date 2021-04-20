//
//  TransitRespHandler.swift
//  
//
//  Created by dmitry on 20.04.2021.
//

import Foundation
import Decorator
import SwiftParser

public final class TransitRespHandler<T: Container & Parsable & Initable>: ParameterizedDecoratorProtocol where T.Item == Data {
    
    public init() { }
    
    public var input: TransitResponse!
    public var output: AppResponse<T.ParseType>!
    
    public var onComplete: (AppResponse<T.ParseType>) -> Void = { _ in }
    
    private var parser = T()
    
    public func execute() {
        output = AppResponse<T.ParseType>(code: httpcode, result: out)
        onComplete(output)
    }
    
    private var httpcode: HTTPCode {
        HTTPCode(rawValue: input.code) ?? .unknown
    }
    
    private var out: Result<T.ParseType, Error>! {
        switch input.result {
        case .success(let data):
            parser.item = data
            return result
        case .failure(let error):
            return .failure(error)
        case .none:
            return .none
        }
    }
    
    private var result: Result<T.ParseType, Error> {
        do {
            return .success(try parser.parse())
        }
        catch {
            return .failure(error)
        }
    }
}
