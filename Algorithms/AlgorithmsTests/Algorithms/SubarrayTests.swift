// Created 27/02/2024.

import XCTest

@testable import Algorithms

final class SubarrayTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: Generation
    
    // MARK: Generation For
    
    func test_generation_A() {
        let arr = [5,7]
    
        let result = Subarray.generateSubarrays(arr)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0], [5])
        XCTAssertEqual(result[1], [5,7])
        XCTAssertEqual(result[2], [7])
    }
    
    func test_generation_B() {
        let arr = [5,7,1,2]
        
        let result = Subarray.generateSubarrays(arr)
        
        XCTAssertEqual(result.count, 10)
        
        XCTAssertEqual(result[0], [5])
        XCTAssertEqual(result[1], [5,7])
        XCTAssertEqual(result[2], [5,7,1])
        XCTAssertEqual(result[3], [5,7,1,2])
        XCTAssertEqual(result[4], [7])
        XCTAssertEqual(result[5], [7,1])
        XCTAssertEqual(result[6], [7,1,2])
        XCTAssertEqual(result[7], [1])
        XCTAssertEqual(result[8], [1,2])
        XCTAssertEqual(result[9], [2])
    }
    
    // MARK: Generation DFS
    
    func test_generation_usingDFS_A() {
        let arr = [5,7]
    
        let result = Subarray.generateSubarraysUsingDFS(arr)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0], [5])
        XCTAssertEqual(result[1], [5,7])
        XCTAssertEqual(result[2], [7])
    }
    
    func test_generation_usingDFS_B() {
        let arr = [5,7,1,2]
        
        let result = Subarray.generateSubarraysUsingDFS(arr)
        
        XCTAssertEqual(result.count, 10)
        
        XCTAssertEqual(result[0], [5])
        XCTAssertEqual(result[1], [5,7])
        XCTAssertEqual(result[2], [5,7,1])
        XCTAssertEqual(result[3], [5,7,1,2])
        XCTAssertEqual(result[4], [7])
        XCTAssertEqual(result[5], [7,1])
        XCTAssertEqual(result[6], [7,1,2])
        XCTAssertEqual(result[7], [1])
        XCTAssertEqual(result[8], [1,2])
        XCTAssertEqual(result[9], [2])
    }
    
    // MARK: Count
    
    func test_count_A() {
        let arr = [5,7]
        
        let result = Subarray.countSubarrays(arr)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_count_B() {
        let arr = [5,7,1,2]
        
        let result = Subarray.countSubarrays(arr)
        
        XCTAssertEqual(result, 10)
    }
}
