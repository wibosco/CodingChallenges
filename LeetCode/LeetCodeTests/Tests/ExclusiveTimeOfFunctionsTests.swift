//
//  ExclusiveTimeOfFunctionsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/03/2022.
//

import XCTest

@testable import LeetCode

final class ExclusiveTimeOfFunctionsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 2
        let logs = ["0:start:0", "1:start:2", "1:end:5", "0:end:6"]
        
        let times = ExclusiveTimeOfFunctions.exclusiveTime(n, logs)
        
        XCTAssertEqual(times, [3, 4])
    }
    
    func test_B() {
        let n = 1
        let logs = ["0:start:0", "0:start:2", "0:end:5", "0:start:6", "0:end:6", "0:end:7"]
        
        let times = ExclusiveTimeOfFunctions.exclusiveTime(n, logs)
        
        XCTAssertEqual(times, [8])
    }
    
    func test_C() {
        let n = 2
        let logs = ["0:start:0", "0:start:2", "0:end:5", "1:start:6", "1:end:6", "0:end:7"]
        
        let times = ExclusiveTimeOfFunctions.exclusiveTime(n, logs)
        
        XCTAssertEqual(times, [7, 1])
    }
}
