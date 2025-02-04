//
//  DetermineIfACellIsReachableAtAGivenTimeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2023.
//

import XCTest

@testable import LeetCode

final class DetermineIfACellIsReachableAtAGivenTimeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let sx = 2
        let sy = 4
        let fx = 7
        let fy = 7
        let t = 6
        
        let result = DetermineIfACellIsReachableAtAGivenTime().isReachableAtTime(sx, sy, fx, fy, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let sx = 3
        let sy = 1
        let fx = 7
        let fy = 3
        let t = 3
        
        let result = DetermineIfACellIsReachableAtAGivenTime().isReachableAtTime(sx, sy, fx, fy, t)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let sx = 7
        let sy = 7
        let fx = 2
        let fy = 4
        let t = 6
        
        let result = DetermineIfACellIsReachableAtAGivenTime().isReachableAtTime(sx, sy, fx, fy, t)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let sx = 870744264
        let sy = 360311537
        let fx = 820090827
        let fy = 890107308
        let t = 274809225
        
        let result = DetermineIfACellIsReachableAtAGivenTime().isReachableAtTime(sx, sy, fx, fy, t)
        
        XCTAssertFalse(result)
    }
}
