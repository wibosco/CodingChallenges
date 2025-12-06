// Created 08/05/2016.


import XCTest

@testable import HackerRank

final class FindDigitsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        let divisibles = FindDigits.findCountOfDivisibleValuesOfNumberInNumber(number: 12)
        
        XCTAssertEqual(2, divisibles)
    }
    
    func test_B() {
        
        let divisibles = FindDigits.findCountOfDivisibleValuesOfNumberInNumber(number: 1012)
        
        XCTAssertEqual(3, divisibles)
    }
    
}
