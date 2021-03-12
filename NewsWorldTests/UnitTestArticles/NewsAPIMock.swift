//
//  NewsAPIMock.swift
//  UnitTestArticles
//
//  Created by Nikolaj Nielsen on 12/03/2021.
//

import Foundation
import Combine
import XCTest

protocol APIProvider {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}

extension URLSession: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

struct NewsAPIMock: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        let path = Bundle.main.path(forResource: "articles.json", ofType: "json")!
        
        let data: Data
        
        do {
            data = try Data(contentsOf: URL(string: path)!, options: .mappedIfSafe)
        } catch {
            data = Data()
        }
        return Just((data: data, response: response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
        
    }
}
