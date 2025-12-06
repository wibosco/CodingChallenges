// Created 15/11/2023.


import XCTest

@testable import LeetCode

final class MostFrequentSubtreeSumTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,2,-3]
        let root = TreeNode.deserialize(data)
        
        let result = MostFrequentSubtreeSum().findFrequentTreeSum(root)
        
        let expectedResult = Set([2,-3,4])
        
        XCTAssertEqual(result.count, expectedResult.count)
        
        //order isn't important
        for sum in result {
            XCTAssertTrue(expectedResult.contains(sum))
        }
    }
    
    func test_B() {
        let data = [5,2,-5]
        let root = TreeNode.deserialize(data)
        
        let result = MostFrequentSubtreeSum().findFrequentTreeSum(root)
        
        let expectedResult = Set([2])
        
        XCTAssertEqual(result.count, expectedResult.count)
        
        //order isn't important
        for sum in result {
            XCTAssertTrue(expectedResult.contains(sum))
        }
    }
}
