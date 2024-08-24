//
//  WeatherEndPoint.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import Core

public struct WeatherEndpoint<R>: Networkable {
  public typealias Response = R

  public var path: String
  public var httpMethod: HTTPMethod
  public var queryParameters: Encodable?
  public var bodyParameters: Encodable?
  public var headers: [String : String]?

  public init(path: String,
              httpMethod: HTTPMethod,
              queryParameters: Encodable? = nil,
              bodyParameters : Encodable? = nil,
              headers: [String : String]? = nil
  ) {
    self.path = path
    self.httpMethod = httpMethod
    self.queryParameters = queryParameters
    self.bodyParameters = bodyParameters
    self.headers = headers
  }

  public func getQueryParameters() throws -> [URLQueryItem]? {
    guard let queryParameters else {
      return nil
    }

    guard let queryDictionary = try? queryParameters.toDictionary() else {
      throw NetworkError.urlRequestError(.queryEncodingError)
    }

    var queryItemList : [URLQueryItem] = []

    queryDictionary.forEach { (key, value) in
      let queryItem = URLQueryItem(name: key, value: "\(value)")
      queryItemList.append(queryItem)
    }

    if queryItemList.isEmpty {
      return nil
    }

    // MARK: Weather API Key
    if let apiKey = Bundle.main.infoDictionary?["WEATHER_API_KEY"] as? String {
      let queryItem = URLQueryItem(name: "appid", value: apiKey)
      queryItemList.append(queryItem)
    }

    return queryItemList
  }
}
