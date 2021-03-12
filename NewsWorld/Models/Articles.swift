//
//  Articles.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

struct Articles: Codable, Hashable {
    var status: String
    var totalResults: Int?
    var articles: [Article]?
    
    var code: String?
    var message: String?
}
