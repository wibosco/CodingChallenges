// Created 27/07/2023.


import XCTest

@testable import LeetCode

final class MinimumNumberOfFlipsToMakeTheBinaryStringAlternatingTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "111000"
        
        let result = MinimumNumberOfFlipsToMakeTheBinaryStringAlternating().minFlips(s)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let s = "010"
        
        let result = MinimumNumberOfFlipsToMakeTheBinaryStringAlternating().minFlips(s)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let s = "1110"
        
        let result = MinimumNumberOfFlipsToMakeTheBinaryStringAlternating().minFlips(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let s = "00100010011110011000110110010100000100001001101100110000111011110111001010101001100000101011111110110001100011101100111010000111100111100011101100101011110011110010010101110000111010101010010010101101011111011101100001011001011111010110011111011011001000110011100111111110000001000001100110001100010101110010111001111011010110001111010001000100100101100001000011001110101000111011011100"
        
        let result = MinimumNumberOfFlipsToMakeTheBinaryStringAlternating().minFlips(s)
        
        XCTAssertEqual(result, 186)
    }
}
