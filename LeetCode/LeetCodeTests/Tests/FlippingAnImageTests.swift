// Created 05/06/2024.


import XCTest

@testable import LeetCode

final class FlippingAnImageTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let image = [[1,1,0],[1,0,1],[0,0,0]]
        
        let result = FlippingAnImage().flipAndInvertImage(image)
        
        XCTAssertEqual(result, [[1,0,0],[0,1,0],[1,1,1]])
    }
    
    func test_B() {
        let image = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
        
        let result = FlippingAnImage().flipAndInvertImage(image)
        
        XCTAssertEqual(result, [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]])
    }
}
