//
//  StaircaseTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class StaircaseTests: XCTestCase {
    
    // MARK: Tests
    
    func test_staircase() {
    
        let staircase = Staircase.staircase(height: 6)
        
        print(staircase)
        
        XCTAssertEqual("     #\n    ##\n   ###\n  ####\n #####\n######", staircase, "Staircasing not valid")
    }
}
