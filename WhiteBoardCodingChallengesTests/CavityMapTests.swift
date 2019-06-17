//
//  CavityMapTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class CavityMapTests: XCTestCase {
    
    // MARK: Tests
    
    func test_cavityMapA() {
        
        let map = ["1112",
                   "1912",
                   "1892",
                   "1234",]
        
        let cavityMap = CavityMap.generateCavityMap(map: map)
        
        let expectedCavityMap = ["1112",
                                 "1X12",
                                 "18X2",
                                 "1234",]
        
        XCTAssertEqual(expectedCavityMap, cavityMap)
    }
    
    func test_cavityMapB() {
        
        let map = ["9"]
        
        let cavityMap = CavityMap.generateCavityMap(map: map)
        
        let expectedCavityMap = ["9"]
        
        XCTAssertEqual(expectedCavityMap, cavityMap)
    }
    
}
