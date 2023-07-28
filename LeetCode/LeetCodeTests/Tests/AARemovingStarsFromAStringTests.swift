//
//  AARemovingStarsFromAStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/07/2023.
//

import XCTest

@testable import LeetCode

final class AARemovingStarsFromAStringTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "leet**cod*e"
        
        let result = RemovingStarsFromAString.removeStars(s)
            
        XCTAssertEqual(result, "lecoe")
    }
    
    func test_B() {
        let s = "erase*****"
        
        let result = RemovingStarsFromAString.removeStars(s)
            
        XCTAssertEqual(result, "")
    }
}
