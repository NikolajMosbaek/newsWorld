//
//  NewsAPI.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Combine
import Foundation

class NewsAPI {
    class func getEverything(searchTerm: String, fromDate: Date = Date(), page: Int) -> AnyPublisher<Articles, Error> {
        let apiKey = "fa53aa231f2a4135bf72c8613884b4c5"
            
        let urlString = "https://newsapi.org/v2/everything?q=\(searchTerm)&from=\(fromDate.toApiFormat())&page=\(page)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            fatalError("String \(urlString) cannot be converted to type URL")
        }
                
        let decorder = JSONDecoder()
        decorder.dateDecodingStrategy = .formatted(DateFormatter.NewsAPIFormat)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Articles.self, decoder: decorder)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
