//
//  LetterCombinationsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LetterCombinationsOfAPhoneNumberTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let digits = "23"
        
        let result = LetterCombinationsOfAPhoneNumber().letterCombinations(digits)
        
        XCTAssertEqual(result, ["ad",
                                "ae",
                                "af",
                                "bd",
                                "be",
                                "bf",
                                "cd",
                                "ce",
                                "cf"])
    }
    
    func test_B() {
        let digits = "2"
        
        let result = LetterCombinationsOfAPhoneNumber().letterCombinations(digits)
        
        XCTAssertEqual(result, ["a",
                                "b",
                                "c"])
    }
    
    func test_C() {
        let digits = ""
        
        let result = LetterCombinationsOfAPhoneNumber().letterCombinations(digits)
        
        XCTAssertEqual(result, [])
    }
    
    func test_D() {
        let digits = "234"
        
        let result = LetterCombinationsOfAPhoneNumber().letterCombinations(digits)
        
        XCTAssertEqual(result, ["adg",
                                "adh",
                                "adi",
                                "aeg",
                                "aeh",
                                "aei",
                                "afg",
                                "afh",
                                "afi",
                                "bdg",
                                "bdh",
                                "bdi",
                                "beg",
                                "beh",
                                "bei",
                                "bfg",
                                "bfh",
                                "bfi",
                                "cdg",
                                "cdh",
                                "cdi",
                                "ceg",
                                "ceh",
                                "cei",
                                "cfg",
                                "cfh",
                                "cfi"])
    }
}
