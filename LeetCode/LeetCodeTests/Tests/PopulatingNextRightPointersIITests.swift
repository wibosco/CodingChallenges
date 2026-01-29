// Created 26/11/2021.

import XCTest

@testable import LeetCode

final class PopulatingNextRightPointersIITests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let data = [1, 2, 3, 4, 5, nil, 7]
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointersII().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, ["1", "#", "2", "3", "#", "4", "5", "7", "#"])
    }
    
    func test_B() {
        let data = [Int]()
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointersII().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, [])
    }
    
    func test_C() {
        let data = [1, 2, 3, 4, 5, nil, 6, 7, nil, nil, nil, nil, 8]
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointersII().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, ["1", "#", "2", "3", "#", "4", "5", "6", "#", "7", "8", "#"])
    }
    
    func test_D() {
        let data = [-1, -7, 9, nil, nil, -1, -7, nil, 8, -9]
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointersII().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, ["-1", "#", "-7", "9", "#", "-1", "-7", "#", "8", "-9", "#"])
    }
}
