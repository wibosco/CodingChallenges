// Created 11/04/2022.

import XCTest

@testable import LeetCode

final class SortCharactersByFrequencyTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "tree"
        
        let result = SortCharactersByFrequency().frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(result == "eetr" || result == "eert")
    }
    
    func test_B() {
        let s = "cccaaa"
        
        let result = SortCharactersByFrequency().frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(result == "cccaaa" || result == "aaaccc")
    }
    
    func test_C() {
        let s = "Aabb"
        
        let result = SortCharactersByFrequency().frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(result == "bbaA" || result == "bbAa")
    }
}
