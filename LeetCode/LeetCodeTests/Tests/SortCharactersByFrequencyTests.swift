//
//  SortCharactersByFrequencyTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/04/2022.
//

import XCTest

@testable import LeetCode

final class SortCharactersByFrequencyTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "tree"
        
        let sorted = SortCharactersByFrequency.frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(sorted == "eetr" || sorted == "eert")
    }
    
    func test_B() {
        let s = "cccaaa"
        
        let sorted = SortCharactersByFrequency.frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(sorted == "cccaaa" || sorted == "aaaccc")
    }
    
    func test_C() {
        let s = "Aabb"
        
        let sorted = SortCharactersByFrequency.frequencySort(s)
        
        //order of same frequency characters isn't important
        XCTAssertTrue(sorted == "bbaA" || sorted == "bbAa")
    }
}
