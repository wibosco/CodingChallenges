//
//  PushDominoesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/07/2023.
//

import XCTest

@testable import LeetCode

final class PushDominoesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let dominoes = "RR.L"
        
        let result = PushDominoes.pushDominoes(dominoes)
        
        XCTAssertEqual(result, "RR.L")
    }
    
    func test_B() {
        let dominoes = ".L.R...LR..L.."
        
        let result = PushDominoes.pushDominoes(dominoes)
        
        XCTAssertEqual(result, "LL.RR.LLRRLL..")
    }
    
    func test_C() {
        let dominoes = "."
        
        let result = PushDominoes.pushDominoes(dominoes)
        
        XCTAssertEqual(result, ".")
    }
}
