// Created 01/06/2016.


import XCTest

@testable import CrackingTheCodingInterview

final class BinarySearchTreeDepthests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let tree = BinarySearchTreeDepth()
        
        let values = [5, 4, 2, 3, 7, 1, 6, 8, 10]
        
        for value in values {
            tree.addValue(value: value)
        }
        
        let lists = tree.nodesInDepth()
        
        XCTAssertEqual(4, lists.count)
    }
    
    func test_B() {
        let tree = BinarySearchTreeDepth()
        
        let values = [5, 4, 2, 3, 7, 1, 6, 8, 10]
        
        for value in values {
            tree.addValue(value: value)
        }
        
        let lists = tree.nodesInDepth()
        
        let secondDepthList = lists[1]
        
        XCTAssertEqual(secondDepthList.head!.binarySearchTreeNode!.value, 4)
        XCTAssertEqual(secondDepthList.head!.next!.binarySearchTreeNode!.value, 7)
    }
    
}
