//
//  ArrayWithElementsNotEqualToAverageOfNeighborsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/07/2023.
//

import XCTest

@testable import LeetCode

final class ArrayWithElementsNotEqualToAverageOfNeighborsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4, 5]
            
        let result = ArrayWithElementsNotEqualToAverageOfNeighbors().rearrangeArray(nums)
        
        XCTAssertEqual(result, [1, 5, 2, 4, 3])
    }
    
    func test_B() {
        let nums = [6, 2, 0, 9, 7]
            
        let result = ArrayWithElementsNotEqualToAverageOfNeighbors().rearrangeArray(nums)
        
        XCTAssertEqual(result, [0, 9, 2, 7, 6])
    }
}
