//
//  Article.swift
//  NewsWorld
//
//  Created by Nikolaj Nielsen on 09/03/2021.
//

import Foundation

struct Article: Codable, Hashable {
    var source: ArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: Date?
    var content: String?
}
