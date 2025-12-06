// Created 11/05/2016.


import XCTest

@testable import HackerRank

final class DikshasBirthdayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let costOfGifts = DikshasBirthday.costOfGifts(10, 10, 1, 1, 1)
        
        XCTAssertEqual(20, costOfGifts)
    }
    
    func test_B() {
        let costOfGifts = DikshasBirthday.costOfGifts(5, 9, 2, 3, 4)
        
        XCTAssertEqual(37, costOfGifts)
    }
    
    func test_C() {
        let costOfGifts = DikshasBirthday.costOfGifts(3, 6, 9, 1, 1)
        
        XCTAssertEqual(12, costOfGifts)
    }
    
    func test_D() {
        let costOfGifts = DikshasBirthday.costOfGifts(7, 7, 4, 2, 1)
        
        XCTAssertEqual(35, costOfGifts)
    }
    
    func test_E() {
        let costOfGifts = DikshasBirthday.costOfGifts(3, 3, 1, 9, 2)
        
        XCTAssertEqual(12, costOfGifts)
    }
    
    func test_G() {
        let costOfGifts = DikshasBirthday.costOfGifts(336, 387, 493, 6650, 1422)
        
        XCTAssertEqual(906753, costOfGifts)
    }
    
    func test_H() {
        let costOfGifts = DikshasBirthday.costOfGifts(363, 28, 8691, 60, 7764)
        
        XCTAssertEqual(2841792, costOfGifts)
    }
    
    func test_I() {
        let costOfGifts = DikshasBirthday.costOfGifts(927, 541, 3427, 9173, 5737)
        
        XCTAssertEqual(8134553, costOfGifts)
    }
    
    func test_J() {
        let costOfGifts = DikshasBirthday.costOfGifts(212, 369, 2568, 6430, 5783)
        
        XCTAssertEqual(2917086, costOfGifts)
    }
    
    func test_K() {
        let costOfGifts = DikshasBirthday.costOfGifts(531, 863, 5124, 4068, 3136)
        
        XCTAssertEqual(6231528, costOfGifts)
    }
    
    func test_L() {
        let costOfGifts = DikshasBirthday.costOfGifts(930, 803, 4023, 3059, 3070)
        
        XCTAssertEqual(6197767, costOfGifts)
    }
    
    func test_M() {
        let costOfGifts = DikshasBirthday.costOfGifts(168, 394, 8457, 5012, 8043)
        
        XCTAssertEqual(3395504, costOfGifts)
    }
    
    func test_N() {
        let costOfGifts = DikshasBirthday.costOfGifts(230, 374, 4422, 4920, 3785)
        
        XCTAssertEqual(2857140, costOfGifts)
    }
    
    func test_O() {
        let costOfGifts = DikshasBirthday.costOfGifts(538, 199, 4325, 8316, 4371)
        
        XCTAssertEqual(3981734, costOfGifts)
    }
    
}
