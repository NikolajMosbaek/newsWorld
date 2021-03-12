//
//  UnitTestArticles.swift
//  UnitTestArticles
//
//  Created by Nikolaj Nielsen on 12/03/2021.
//

import Combine
import XCTest
@testable import NewsWorld

class UnitTestArticles: XCTestCase {

    private var subscriptions = [AnyCancellable]()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticlesParsing() throws {
        let api = NewsAPIMock()
        api.apiResponse(for: URLRequest(url: URL(string: "www.google.com")!)).sink { complete in
            
        } receiveValue: { result in
            debugPrint(result)
        }.store(in: &self.subscriptions)

    }

}
