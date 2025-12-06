// Created 05/07/2023.


import XCTest

@testable import LeetCode

final class PartitionLabelsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "ababcbacadefegdehijhklij"
        
        let result = PartitionLabels().partitionLabels(s)
        
        XCTAssertEqual(result, [9, 7, 8])
    }
    
    func test_B() {
        let s = "eccbbbbdec"
        
        let result = PartitionLabels().partitionLabels(s)
        
        XCTAssertEqual(result, [10])
    }
}
