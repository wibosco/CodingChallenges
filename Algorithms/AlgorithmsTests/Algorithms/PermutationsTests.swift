//
//  PermutationsTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 11/07/2023.
//

import XCTest

@testable import Algorithms

final class PermutationsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2]
        
        let result = Permutations.generatePermutations(nums)
        
        XCTAssertEqual(result.count, 2)
        
        XCTAssertTrue(result.contains([1, 2]))
        XCTAssertTrue(result.contains([2, 1]))
    }
    
    func test_B() {
        let nums = [1, 2, 3]
        
        let result = Permutations.generatePermutations(nums)
        
        XCTAssertEqual(result.count, 6)
        
        XCTAssertTrue(result.contains([1, 2, 3]))
        XCTAssertTrue(result.contains([1, 3, 2]))
        XCTAssertTrue(result.contains([2, 1, 3]))
        XCTAssertTrue(result.contains([1, 3, 2]))
        XCTAssertTrue(result.contains([3, 2, 1]))
        XCTAssertTrue(result.contains([3, 1, 2]))
    }
}
