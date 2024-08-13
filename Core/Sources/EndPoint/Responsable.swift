//
//  Responsable.swift
//  ExampleApp
//
//  Created by Kanghos on 8/10/24.
//

import Foundation

public struct EmptyData : Decodable, Equatable { }

public protocol Responsable {
  associatedtype Response
}
