// Created 13/12/2023.


import XCTest

@testable import LeetCode

final class StepByStepDirectionsFromABinaryTreeNodeToAnotherTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let startValue = 3
        let destValue = 6
        let data = [5,1,2,3,nil,6,4]
        let root = TreeNode.deserialize(data)
        
        let result = StepByStepDirectionsFromABinaryTreeNodeToAnother().getDirections(root, startValue, destValue)
        
        XCTAssertEqual(result, "UURL")
    }
    
    func test_B() {
        let startValue = 2
        let destValue = 1
        let data = [2,1]
        let root = TreeNode.deserialize(data)
        
        let result = StepByStepDirectionsFromABinaryTreeNodeToAnother().getDirections(root, startValue, destValue)
        
        XCTAssertEqual(result, "L")
    }
}
