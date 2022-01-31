//
//  OffByOneTests.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

class OffByOneTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "ple"))
    }
    
    func test_B() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pales", destination: "pale"))
    }
    
    func test_C() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "bale"))
    }
    
    func test_D() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "pale", destination: "bae"))
    }
    
    func test_E() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "paled", destination: "bae"))
    }
    
    func test_F() {
        
        XCTAssertFalse(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "bae", destination: "breed"))
    }
    
    func test_G() {
        
        XCTAssertTrue(OffByOne.canTransformSourceStringIntoDestinationStringWithOneChange(source: "bae", destination: "bae"))
    }
}
