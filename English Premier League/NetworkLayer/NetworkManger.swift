//
//  NetworkManger.swift
//  English Premier League
//
//  Created by Yehia Samak on 11/04/2023.
//

import Combine
import Foundation

public protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

class NetworkManger: Requestable {
    public var requestTimeOut: Float = 30
    
    public func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
    where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard let url = URL(string: req.url) else {
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url"))
            )
        }
        return URLSession.shared
            .dataTaskPublisher(for: req.buildURLRequest(with: url))
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}

