//
//  EnCodable.swift
//  ExampleApp
//
//  Created by Kanghos on 8/10/24.
//

import Foundation

extension Encodable  {
    public func toDictionary() throws -> [String : Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        return jsonObject as? [String : Any]
    }
}
