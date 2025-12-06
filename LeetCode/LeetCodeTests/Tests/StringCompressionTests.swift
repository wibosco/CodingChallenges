// Created 04/09/2024.


import XCTest

@testable import LeetCode

final class StringCompressionTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        var chars: [Character] = ["a","a","b","b","c","c","c"]
        
        let result = StringCompression().compress(&chars)
        
        XCTAssertEqual(result, 6)
        XCTAssertEqual(chars[0..<6], ["a","2","b","2","c","3"])
    }
    
    func test_B() {
        var chars: [Character] = ["a"]
        
        let result = StringCompression().compress(&chars)
        
        XCTAssertEqual(result, 1)
        XCTAssertEqual(chars[0..<1], ["a"])
    }
    
    func test_C() {
        var chars: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        
        let result = StringCompression().compress(&chars)
        
        XCTAssertEqual(result, 4)
        XCTAssertEqual(chars[0..<4], ["a","b","1","2"])
    }
    
    func test_D() {
        var chars: [Character] = ["a","a","a","b","b","a","a"]
        
        let result = StringCompression().compress(&chars)
        
        XCTAssertEqual(result, 6)
        XCTAssertEqual(chars[0..<6], ["a","3","b","2","a","2"])
    }
    
    func test_E() {
        var chars: [Character] = ["a","b","c"]
        
        let result = StringCompression().compress(&chars)
        
        XCTAssertEqual(result, 3)
        XCTAssertEqual(chars[0..<3], ["a","b","c"])
    }
}
