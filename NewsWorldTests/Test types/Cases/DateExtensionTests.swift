//
//  DateExtensionTests.swift
//  UnitTestArticles
//
//  Created by Nikolaj Nielsen on 12/03/2021.
//

import XCTest
@testable import NewsWorld

class DateExtensionTests: XCTestCase {
    
    func testDateToApiFormat() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: "08/03/2021")
        
        XCTAssertEqual(date?.toApiFormat(), "2021-03-08")
    }

    func testDateToText() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: "08/03/2021")
        
        XCTAssertEqual(date?.toText(), "08/03-21")
    }
}
