// Created 26/08/2023.


import XCTest

@testable import LeetCode

final class MaximumLengthOfPairChainTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let pairs = [[1, 2], [2, 3], [3, 4]]
        
        let result = MaximumLengthOfPairChain().findLongestChain(pairs)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let pairs = [[1, 2], [7, 8], [4, 5]]
        
        let result = MaximumLengthOfPairChain().findLongestChain(pairs)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let pairs = [[-7, -2], [0, 8], [0, 7], [-2, 7], [5, 9], [9, 10]]
        
        let result = MaximumLengthOfPairChain().findLongestChain(pairs)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let pairs = [[7, 9], [4, 5], [7, 9], [-7, -1], [0, 10], [3, 10], [3, 6], [2, 3]]
        
        let result = MaximumLengthOfPairChain().findLongestChain(pairs)
        
        XCTAssertEqual(result, 4)
    }
}
