//
//  RepeatedDNASequencesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/02/2022.
//

import XCTest

@testable import LeetCode

final class RepeatedDNASequencesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
        
        let sequences = RepeatedDNASequences().findRepeatedDnaSequences(s)
        
        let expectedMatches = ["AAAAACCCCC", "CCCCCAAAAA"]
        
        //order isn't important
        for sequence in sequences {
            XCTAssertTrue(expectedMatches.contains(sequence))
        }
        
        XCTAssertEqual(sequences.count, expectedMatches.count)
    }
    
    func test_B() {
        let s = "AAAAAAAAAAAAA"
        
        let sequences = RepeatedDNASequences().findRepeatedDnaSequences(s)
        
        let expectedMatches = ["AAAAAAAAAA"]
        
        //order isn't important
        for sequence in sequences {
            XCTAssertTrue(expectedMatches.contains(sequence))
        }
        
        XCTAssertEqual(sequences.count, expectedMatches.count)
    }
    
    func test_C() {
        let s = "A"
        
        let sequences = RepeatedDNASequences().findRepeatedDnaSequences(s)
        
        XCTAssertEqual(sequences, [String]())
    }
}
