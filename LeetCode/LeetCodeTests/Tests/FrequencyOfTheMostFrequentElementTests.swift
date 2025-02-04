//
//  FrequencyOfTheMostFrequentElementTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/07/2023.
//

import XCTest

@testable import LeetCode

final class FrequencyOfTheMostFrequentElementTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 4]
        let k = 5
        
        let result = FrequencyOfTheMostFrequentElement().maxFrequency(nums, k)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [1, 4, 8, 13]
        let k = 5
        
        let result = FrequencyOfTheMostFrequentElement().maxFrequency(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let nums = [3, 9, 6]
        let k = 2
        
        let result = FrequencyOfTheMostFrequentElement().maxFrequency(nums, k)
        
        XCTAssertEqual(result, 1)
    }
}
