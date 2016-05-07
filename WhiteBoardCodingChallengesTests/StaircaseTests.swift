//
//  StaircaseTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class StaircaseTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_staircase() {
    
        let staircase = Staircase.staircase(6)
        
        print(staircase)
        
        XCTAssertEqual("     #\n    ##\n   ###\n  ####\n #####\n######", staircase, "Staircasing not valid")
    }
    
}
