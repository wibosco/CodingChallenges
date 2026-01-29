// Created 16/12/2021.

import XCTest

@testable import LeetCode

final class SwapNodesInPairsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4]
        
        let head = ListNode.deserialize(data)
        
        let result = SwapNodesInPairs().swapPairs(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [2, 1, 4, 3])
    }
    
    func test_B() {
        let data = [Int]()
        
        let head = ListNode.deserialize(data)
        
        let result = SwapNodesInPairs().swapPairs(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let data = [1]
        
        let head = ListNode.deserialize(data)
        
        let result = SwapNodesInPairs().swapPairs(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }

}
