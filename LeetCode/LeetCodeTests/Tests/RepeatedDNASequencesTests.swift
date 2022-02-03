//
//  RepeatedDNASequencesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/02/2022.
//

import XCTest

@testable import LeetCode

class RepeatedDNASequencesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
        
        let sequences = RepeatedDNASequences.findRepeatedDnaSequences(s)
        
        let expectedMatches = ["AAAAACCCCC", "CCCCCAAAAA"]
        var countOfMatches = 0
        
        //order isn't important
        for sequence in sequences {
            XCTAssertTrue(expectedMatches.contains(sequence))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedMatches.count)
    }
    
    func test_B() {
        let s = "AAAAAAAAAAAAA"
        
        let sequences = RepeatedDNASequences.findRepeatedDnaSequences(s)
        
        XCTAssertEqual(sequences, ["AAAAAAAAAA"])
    }
    
    func test_C() {
        let s = "A"
        
        let sequences = RepeatedDNASequences.findRepeatedDnaSequences(s)
        
        XCTAssertEqual(sequences, [String]())
    }
}
