// Created 07/12/2023.

import XCTest

@testable import LeetCode

final class AmountOfTimeForBinaryTreeToBeInfectedTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let start = 3
        let data = [1,5,3,nil,4,10,6,9,2]
        let root = TreeNode.deserialize(data)
        
        let result = AmountOfTimeForBinaryTreeToBeInfected().amountOfTime(root, start)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let start = 1
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = AmountOfTimeForBinaryTreeToBeInfected().amountOfTime(root, start)
        
        XCTAssertEqual(result, 0)
    }
}
