//
//  EndPointType.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public typealias HTTPHeaders = [String:String]

protocol EndPointType {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    func makeComponent(queryItems: [URLQueryItem]?) -> URLComponents
}
