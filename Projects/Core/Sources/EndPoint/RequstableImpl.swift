//
//  RequstableImpl.swift
//  ExampleApp
//
//  Created by Kanghos on 8/10/24.
//

import Foundation

extension Requestable {
  public func makeURLRequest() throws -> URLRequest {
    guard var urlComponent = try makeURLComponents() else {
      throw NetworkError.urlRequestError(.urlComponentError)
    }

    if let queryItems = try getQueryParameters() {
      urlComponent.queryItems = queryItems
    }

    guard let url = urlComponent.url else {
      throw NetworkError.invalidURLError
    }

    var urlRequest = URLRequest(url: url)

    if let httpBody = try getBodyParameters() {
      urlRequest.httpBody = httpBody
    }

    if let headers {
      headers.forEach { key, value in
        urlRequest.setValue(value, forHTTPHeaderField: key)
      }
    }

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.httpMethod = httpMethod.rawValue

    return urlRequest
  }

  private func makeURLComponents() throws -> URLComponents? {
    guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
      throw NetworkError.urlRequestError(.makeURLError)
    }
    
    return URLComponents(string: baseURL + path)
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
    
    return queryItemList
  }
  
  private func getBodyParameters() throws -> Data? {
    guard let bodyParameters else {
      return nil
    }
    
    guard let bodyDictionary = try? bodyParameters.toDictionary() else {
      throw NetworkError.urlRequestError(.bodyEncodingError)
    }
    
    guard let encodedBody = try? JSONSerialization.data(withJSONObject: bodyDictionary) else {
      throw NetworkError.urlRequestError(.bodyEncodingError)
    }
    
    return encodedBody
  }
}
