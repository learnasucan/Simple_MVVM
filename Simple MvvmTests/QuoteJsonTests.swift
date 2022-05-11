//
//  QuoteJsonTests.swift
//  Simple MvvmTests
//
//  Created by Prachit on 11/05/22.
//

import XCTest
@testable import Simple_Mvvm

class QuoteJsonTests: XCTestCase {

    var quotes = [Quote]()
    var exampleJSONData: Data!
    
    override func setUpWithError() throws {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "QuoteResponse", withExtension: "json")!
        exampleJSONData = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        quotes = try! decoder.decode([Quote].self, from: exampleJSONData)
    }

    override func tearDownWithError() throws {
        quotes.removeAll()
    }

    func test_Total_Count() throws {
        XCTAssertEqual(quotes.count, 5)
    }

    func testTotalCountNotNil() throws {
        XCTAssertTrue(quotes.count > 0)
    }
    
    func test_First_Quote_Author() throws {
        XCTAssertEqual(quotes.first?.author, "Jesse Pinkman")
    }
    
}
