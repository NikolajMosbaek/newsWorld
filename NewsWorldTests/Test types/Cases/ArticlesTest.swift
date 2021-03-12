//
//  ArticlesTest.swift
//  UnitTestArticles
//
//  Created by Nikolaj Nielsen on 12/03/2021.
//

import XCTest
@testable import NewsWorld

class ArticlesTest: XCTestCase {
    
    func testArticlesParsing() throws {
        let data = try getData(fromJSON: "articles")
        
        let decorder = JSONDecoder()
        decorder.dateDecodingStrategy = .formatted(DateFormatter.NewsAPIFormat)
        let result = try decorder.decode(Articles.self, from: data)
        
        XCTAssertTrue(result.status == "ok")
        XCTAssertTrue(result.totalResults == 42)
        XCTAssertTrue(result.articles?.count == 1)
        
        XCTAssertTrue(result.articles?.first!.source?.id == "ctg")
        XCTAssertTrue(result.articles?.first!.source?.name == "Cottington")
        XCTAssertTrue(result.articles?.first!.author == "Ford Prefect")
        XCTAssertTrue(result.articles?.first!.title == "The Hitchhiker's Guide to the Galaxy")
        XCTAssertTrue(result.articles?.first!.description == "Travel the Galaxy without dying")
        XCTAssertTrue(result.articles?.first!.url == URL(string: "https://www.google.com/search?client=safari&rls=en&q=hitchhikers+guide+to+the+galaxy&ie=UTF-8&oe=UTF-8"))
        XCTAssertTrue(result.articles?.first!.urlToImage == URL(string: "https://m.media-amazon.com/images/M/MV5BZmU5MGU4MjctNjA2OC00N2FhLWFhNWQtMzQyMGI2ZmQ0Y2YyL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"))
        XCTAssertTrue(result.articles?.first!.content == "For instance, on the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much—the wheel, New York, wars and so on—whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man—for precisely the same reasons")
    }
}
