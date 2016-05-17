//
//  BiggerIsGreaterTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class BiggerIsGreaterTests: XCTestCase {
    
    // MARK: Tests
    
    func test_biggerIsGreaterA() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterB() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterC() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterD() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterE() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterF() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginal("abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    // MARK: Alt
    
    func test_biggerIsGreaterAltD() {
        
        let greaterPermutations = BiggerIsGreater.permutationGreaterThanOrginalAlt("dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    // MARK: AltAlt
    
    func test_biggerIsGreaterAltAltD() {
        
        var characters = "dhck".characters.map{String($0)}
        
        var greaterThan: String?
        
        BiggerIsGreater.possiblePermutationsAlt(characters.count, a: &characters, original: "dhck", greaterValue: &greaterThan)
        
        XCTAssertEqual("dhkc", greaterThan!)
    }
    
}
