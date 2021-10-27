//
//  BiggerIsGreaterTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class BiggerIsGreaterTests: XCTestCase {
    
    // MARK: Tests
    
    func test_biggerIsGreaterA() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterB() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterC() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterD() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterE() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterF() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal(original: "abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    // MARK: Alt
    
    func test_biggerIsGreaterAltD() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginalAlt(original: "dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    // MARK: AltAlt
    
    func test_biggerIsGreaterAltAltD() {
        
        var characters = "dhck".map{String($0)}
        
        var greaterThan: String?
        
        BiggerIsGreater.possiblePermutationsAlt(n: characters.count, a: &characters, original: "dhck", greaterValue: &greaterThan)
        
        XCTAssertEqual("dhkc", greaterThan!)
    }
    
}
