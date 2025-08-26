//
//  SortArrayByParityTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/06/2024.
//

import XCTest

@testable import LeetCode

final class SortArrayByParityTests: XCTestCase {


    // MARK: - Tests
    
    func test_A() {
        let nums = [3,1,2,4]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        //the order within the even and odd sections isn't important
        XCTAssertEqual(result, [4,2,1,3])
    }
    
    func test_B() {
        let nums = [0]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        //the order within the even and odd sections isn't important
        XCTAssertEqual(result, [0])
    }
    
    func test_C() {
        let nums = [1,2,3,4]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        //the order within the even and odd sections isn't important
        XCTAssertEqual(result, [4,2,3,1])
    }
}
