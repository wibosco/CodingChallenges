// Created 31/10/2023.

import XCTest

@testable import LeetCode

final class MinimumScoreOfAPathBetweenTwoCitiesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 4
        let roads = [[1,2,9],
                     [2,3,6],
                     [2,4,5],
                     [1,4,7]]
        
        let result = MinimumScoreOfAPathBetweenTwoCities().minScore(n, roads)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let n = 4
        let roads = [[1,2,2],
                     [1,3,4],
                     [3,4,7]]
        
        let result = MinimumScoreOfAPathBetweenTwoCities().minScore(n, roads)
        
        XCTAssertEqual(result, 2)
    }
}
