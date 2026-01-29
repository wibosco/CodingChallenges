// Created 15/11/2021.

import XCTest

@testable import LeetCode

final class CopyListWithRandomPointerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list = ListNodeRandom.deserialize([[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
        
        let copy = CopyListWithRandomPointer().copyRandomList(list)
        
        let result = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(result, [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
    }
    
    func test_B() {
        let list = ListNodeRandom.deserialize([[1, 1], [2, 1]])
        
        let copy = CopyListWithRandomPointer().copyRandomList(list)
        
        let result = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(result, [[1, 1], [2, 1]])
    }
    
    func test_C() {
        let list = ListNodeRandom.deserialize([[3, nil], [3, 0], [3, nil]])
        
        let copy = CopyListWithRandomPointer().copyRandomList(list)
        
        let result = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(result, [[3, nil], [3, 0], [3, nil]])
    }
    
    func test_D() {
        let list = ListNodeRandom.deserialize([])
        
        let copy = CopyListWithRandomPointer().copyRandomList(list)
        
        let result = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(result, [])
    }

}
