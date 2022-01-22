//
//  NRepeatedElementInSize2NArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class NRepeatedElementInSize2NArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 3]
        
        let repeatedElement = NRepeatedElementInSize2NArray.repeatedNTimes(nums)
        
        XCTAssertEqual(repeatedElement, 3)
    }
    
    func test_B() {
        let nums = [2, 1, 2, 5, 3, 2]
        
        let repeatedElement = NRepeatedElementInSize2NArray.repeatedNTimes(nums)
        
        XCTAssertEqual(repeatedElement, 2)
    }
    
    func test_C() {
        let nums = [5, 1, 5, 2, 5, 3, 5, 4]
        
        let repeatedElement = NRepeatedElementInSize2NArray.repeatedNTimes(nums)
        
        XCTAssertEqual(repeatedElement, 5)
    }
}
