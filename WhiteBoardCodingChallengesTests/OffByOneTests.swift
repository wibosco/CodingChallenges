//
//  OffByOneTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class OffByOneTests: XCTestCase {
    

    // MARK: Tests
    
    func test_OffByOneA() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "ple"))
    }
    
    func test_offByOneB() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pales", destination: "pale"))
    }
    
    func test_offByOneC() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "bale"))
    }
    
    func test_offByOneD() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "bae"))
    }
    
    func test_offByOneE() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "paled", destination: "bae"))
    }
    
    func test_offByOneF() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "bae", destination: "breed"))
    }
    
    func test_offByOneG() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "bae", destination: "bae"))
    }
}
