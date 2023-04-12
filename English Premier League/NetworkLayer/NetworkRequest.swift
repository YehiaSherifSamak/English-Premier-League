//
//  NetworkRequest.swift
//  English Premier League
//
//  Created by Yehia Samak on 11/04/2023.
//

import Foundation

protocol Request {
    var url: String { get}
    var headers: [String: String]? { get }
    var body: Data? { get }
    var requestTimeOut: Float? { get }
    var httpMethod: HTTPMethod { get }
    
    func createRequest() -> NetworkRequest
}

extension Request {
    func createRequest() -> NetworkRequest {
        return NetworkRequest(url: "\(Constants.baseURL)\(self.url)", headers: self.headers, reqBody: self.body, reqTimeout: self.requestTimeOut, httpMethod: self.httpMethod)
    }
}

public struct NetworkRequest {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Encodable? = nil,
                reqTimeout: Float? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = reqBody?.encode()
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
    }
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Data? = nil,
                reqTimeout: Float? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = reqBody
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        urlRequest.httpBody = body
        return urlRequest
    }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}
