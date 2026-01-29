// Created 03/07/2023.

import XCTest

@testable import LeetCode

final class NetworkDelayTimeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let times = [[2, 1, 1], [2, 3, 1], [3, 4, 1]]
        let n = 4
        let k = 2
        
        let result = NetworkDelayTime().networkDelayTime(times, n, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let times = [[1, 2, 1]]
        let n = 2
        let k = 1
        
        let result = NetworkDelayTime().networkDelayTime(times, n, k)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let times = [[1 ,2, 1]]
        let n = 2
        let k = 2
        
        let result = NetworkDelayTime().networkDelayTime(times, n, k)
        
        XCTAssertEqual(result, -1)
    }
}
