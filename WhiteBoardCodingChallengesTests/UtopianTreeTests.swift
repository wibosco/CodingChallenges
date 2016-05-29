//
//  UtopianTreeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class UtopianTreeTests: XCTestCase {
    
    // MARK: Tests
    
    func test_heightAfter0Cycles() {
        
        let height = UtopianTree.heightOfTree(0)
        
        XCTAssertEqual(1, height)
    }
    
    func test_heightAfter1Cycles() {
        
        let height = UtopianTree.heightOfTree(1)
        
        XCTAssertEqual(2, height)
    }
    
    func test_heightAfter4Cycles() {
     
        let height = UtopianTree.heightOfTree(4)
        
        XCTAssertEqual(7, height)
    }
}
