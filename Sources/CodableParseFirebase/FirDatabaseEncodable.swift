//
//  FirDatabaseEncoder.swift
//  
//  Created by Chrystian Salgado on 07/02/21.
//

import Foundation

open class FirDatabaseEncoder {
    public init() {}
    
    open var userInfo: [CodingUserInfoKey : Any] = [:]
    
    open func encode<Value : Encodable>(_ value: Value) throws -> [String: Any] {
        let topLevel = try encodeToTopLevelContainer(value)
        switch topLevel {
        case let top as [String: Any]:
            return top
        default:
            throw EncodingError.invalidValue(value,
                                             EncodingError.Context(codingPath: [],
                                                                   debugDescription: "Top-level \(Value.self) encoded not as dictionary."))
        }
    }
    
    internal func encodeToTopLevelContainer<Value : Encodable>(_ value: Value) throws -> Any {
        let options = _FirebaseEncoder._Options(
            dateEncodingStrategy: nil,
            dataEncodingStrategy: nil,
            skipFirestoreTypes: true,
            userInfo: userInfo
        )
        let encoder = _FirebaseEncoder(options: options)
        guard let topLevel = try encoder.box_(value) else {
            throw EncodingError.invalidValue(value,
                                             EncodingError.Context(codingPath: [],
                                                                   debugDescription: "Top-level \(Value.self) did not encode any values."))
        }
        
        return topLevel
    }
}
