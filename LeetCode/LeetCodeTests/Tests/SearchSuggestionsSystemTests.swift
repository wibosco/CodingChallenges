//
//  SearchSuggestionsSystemTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/08/2023.
//

import XCTest

@testable import LeetCode

final class SearchSuggestionsSystemTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let products = ["mobile", "mouse", "moneypot", "monitor", "mousepad"]
        let searchWord = "mouse"
        
        let result = SearchSuggestionsSystem().suggestedProducts(products, searchWord)
        
        XCTAssertEqual(result, [["mobile", "moneypot", "monitor"],
                                ["mobile", "moneypot", "monitor"],
                                ["mouse", "mousepad"],
                                ["mouse", "mousepad"],
                                ["mouse", "mousepad"]])
    }
    
    func test_B() {
        let products = ["havana"]
        let searchWord = "havana"
        
        let result = SearchSuggestionsSystem().suggestedProducts(products, searchWord)
        
        XCTAssertEqual(result, [["havana"],
                                ["havana"],
                                ["havana"],
                                ["havana"],
                                ["havana"],
                                ["havana"]])
    }
    
    func test_C() {
        let products = ["bags", "baggage", "banner", "box", "cloths"]
        let searchWord = "bags"
        
        let result = SearchSuggestionsSystem().suggestedProducts(products, searchWord)
        
        XCTAssertEqual(result, [["baggage", "bags", "banner"],
                                ["baggage", "bags", "banner"],
                                ["baggage", "bags"],
                                ["bags"]])
    }
}
