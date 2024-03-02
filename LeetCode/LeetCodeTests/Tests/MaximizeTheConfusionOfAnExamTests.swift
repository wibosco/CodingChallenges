//
//  MaximizeTheConfusionOfAnExamTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/03/2024.
//

import XCTest

@testable import LeetCode

final class MaximizeTheConfusionOfAnExamTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let answerKey = "TTFF"
        let k = 2
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let answerKey = "TFFT"
        let k = 1
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let answerKey = "TTFTTFTT"
        let k = 1
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_D() {
        let answerKey = "TTFFTTFFFFFF"
        let k = 1
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_E() {
        let answerKey = "TT"
        let k = 1
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_F() {
        let answerKey = "TTFTTTTTFT"
        let k = 1
        
        let result = MaximizeTheConfusionOfAnExam().maxConsecutiveAnswers(answerKey, k)
        
        XCTAssertEqual(result, 8)
    }
}
