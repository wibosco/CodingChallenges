// Created 05/05/2023.


import XCTest

@testable import LeetCode

final class PermutationInStringTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s1 = "ab"
        let s2 = "eidbaooo"
        
        let result = PermutationInString().checkInclusion(s1, s2)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s1 = "ab"
        let s2 = "eidboaoo"
        
        let result = PermutationInString().checkInclusion(s1, s2)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s1 = "adc"
        let s2 = "dcda"
        
        let result = PermutationInString().checkInclusion(s1, s2)
        
        XCTAssertTrue(result)
    }
}
