//
//  KClosestPointsToOriginTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class KClosestPointsToOriginTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let points = [[1, 3],
                      [-2, 2]]
        let k = 1
        
        let closestPoints = KClosestPointsToOrigin.kClosest(points, k)
        
        XCTAssertEqual(closestPoints, [[-2, 2]])
    }
    
    func test_B() {
        let points = [[3, 3],
                      [5, -1],
                      [-2, 4]]
        let k = 2
        
        let closestPoints = KClosestPointsToOrigin.kClosest(points, k)
        
        XCTAssertEqual(closestPoints, [[3, 3], [-2, 4]])
    }
    
    func test_C() {
        let points = [[0, 1],
                      [1, 0]]
        let k = 2
        
        let closestPoints = KClosestPointsToOrigin.kClosest(points, k)
        
        XCTAssertEqual(closestPoints, [[0, 1], [1, 0]])
    }
    
    func test_D() {
        let points = [[-2, 10],
                      [-4, -8],
                      [10, 7],
                      [-4, -7]]
        let k = 3

        let closestPoints = KClosestPointsToOrigin.kClosest(points, k)
        
        XCTAssertEqual(closestPoints, [[-4, -7], [-4, -8], [-2, 10]])
    }
    
    func test_E() {
        let points = [[68, 97],
                      [34, -84],
                      [60, 100],
                      [2, 31],
                      [-27, -38],
                      [-73, -74],
                      [-55, -39],
                      [62, 91],
                      [62, 92],
                      [-57, -67]]
        let k = 5

        let closestPoints = KClosestPointsToOrigin.kClosest(points, k)
        
        XCTAssertEqual(closestPoints, [[2, 31], [-27, -38], [-55, -39], [-57, -67], [34, -84]])
    }
}
