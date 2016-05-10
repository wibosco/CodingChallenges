//
//  LibraryFineTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class LibraryFineTests: XCTestCase {
    
    // MARK: Test
    
    func test_fineA() {
        
        let fine = LibraryFine.calculateFine("9 6 2015", expectedDueDate: "6 6 2015")
        
        XCTAssertEqual(45, fine)
    }
    
    func test_fineB() {
        
        let fine = LibraryFine.calculateFine("2 7 1014", expectedDueDate: "1 1 1014")
        
        XCTAssertEqual(3000, fine)
    }
    
    func test_fineC() {
        
        let fine = LibraryFine.calculateFine("4 5 2014", expectedDueDate: "1 1 1015")
        
        XCTAssertEqual(10000, fine)
    }
    
}
