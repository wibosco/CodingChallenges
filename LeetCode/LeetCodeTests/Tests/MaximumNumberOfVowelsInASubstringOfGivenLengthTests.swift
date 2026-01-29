// Created 26/07/2023.

import XCTest

@testable import LeetCode

final class MaximumNumberOfVowelsInASubstringOfGivenLengthTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "abciiidef"
        let k = 3
        
        let result = MaximumNumberOfVowelsInASubstringOfGivenLength().maxVowels(s, k)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let s = "aeiou"
        let k = 2
        
        let result = MaximumNumberOfVowelsInASubstringOfGivenLength().maxVowels(s, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let s = "leetcode"
        let k = 3
        
        let result = MaximumNumberOfVowelsInASubstringOfGivenLength().maxVowels(s, k)
        
        XCTAssertEqual(result, 2)
    }
}
