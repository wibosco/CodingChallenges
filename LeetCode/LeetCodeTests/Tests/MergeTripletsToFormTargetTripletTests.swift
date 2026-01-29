// Created 04/07/2023.

import XCTest

@testable import LeetCode

final class MergeTripletsToFormTargetTripletTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let triplets = [[2, 5, 3], [1, 8, 4], [1, 7, 5]]
        let target = [2, 7, 5]
        
        let result = MergeTripletsToFormTargetTriplet().mergeTriplets(triplets, target)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let triplets = [[3, 4, 5], [4, 5, 6]]
        let target = [3, 2, 5]
        
        let result = MergeTripletsToFormTargetTriplet().mergeTriplets(triplets, target)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let triplets = [[2, 5, 3], [2, 3, 4], [1, 2, 5], [5, 2, 3]]
        let target = [5, 5, 5]
        
        let result = MergeTripletsToFormTargetTriplet().mergeTriplets(triplets, target)
        
        XCTAssertTrue(result)
    }
}
