//
//  OffByOneTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class OffByOneTests: XCTestCase {
    

    // MARK: Tests
    
    func test_OffByOneA() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("pale", destination: "ple"))
    }
    
    func test_offByOneB() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("pales", destination: "pale"))
    }
    
    func test_offByOneC() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("pale", destination: "bale"))
    }
    
    func test_offByOneD() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("pale", destination: "bae"))
    }
    
    func test_offByOneE() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("paled", destination: "bae"))
    }
    
    func test_offByOneF() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("bae", destination: "breed"))
    }
    
    func test_offByOneG() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange("bae", destination: "bae"))
    }
}
