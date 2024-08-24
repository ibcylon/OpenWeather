//
//  Requestable.swift
//  ExampleApp
//
//  Created by Kanghos on 8/10/24.
//

import Foundation

public protocol Requestable {
  var path: String { get }
  var httpMethod : HTTPMethod { get }
  var queryParameters: Encodable? { get }
  var bodyParameters: Encodable? { get }
  var headers: [String : String]? { get }

  func makeURLRequest() throws -> URLRequest
  func getQueryParameters() throws -> [URLQueryItem]?
}
