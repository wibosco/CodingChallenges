// Created 30/03/2022.


import XCTest

@testable import LeetCode

final class ShortestWordDistanceIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let words = ["practice", "makes", "perfect", "coding", "makes"]
        let wordDistance = ShortestWordDistanceII.init(words)
        
        let distance1 = wordDistance.shortest("coding", "practice")
        
        XCTAssertEqual(distance1, 3)
        
        let distance2 = wordDistance.shortest("makes", "coding")
        
        XCTAssertEqual(distance2, 1)
    }
}
