//
//  PeakIndexMountainArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class PeakIndexMountainArrayTests: XCTestCase {

   // MARK: - Tests

    func test_A() {
        let arr = [0, 1, 0]
        
        let peak = PeakIndexMountainArray.peakIndexInMountainArray(arr)
        
        XCTAssertEqual(peak, 1)
    }
    
    func test_B() {
        let arr = [0, 2, 1, 0]
        
        let peak = PeakIndexMountainArray.peakIndexInMountainArray(arr)
        
        XCTAssertEqual(peak, 1)
    }
    
    func test_C() {
        let arr = [0, 10, 5, 2]
        
        let peak = PeakIndexMountainArray.peakIndexInMountainArray(arr)
        
        XCTAssertEqual(peak, 1)
    }
    
    func test_D() {
        let arr = [3, 4, 5, 1]
        
        let peak = PeakIndexMountainArray.peakIndexInMountainArray(arr)
        
        XCTAssertEqual(peak, 2)
    }
    
    func test_E() {
        let arr = [24, 69, 100, 99, 79, 78, 67, 36, 26, 19]
        
        let peak = PeakIndexMountainArray.peakIndexInMountainArray(arr)
        
        XCTAssertEqual(peak, 2)
    }
}
