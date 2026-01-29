// Created 06/07/2023.

import XCTest

@testable import LeetCode

final class ReplaceElementsWithGreatestElementOnRightSideTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let arr = [17, 18, 5, 4, 6, 1]
            
        let result = ReplaceElementsWithGreatestElementOnRightSide().replaceElements(arr)
        
        XCTAssertEqual(result, [18, 6, 6, 6, 1, -1])
    }
    
    func test_B() {
        let arr = [400]
            
        let result = ReplaceElementsWithGreatestElementOnRightSide().replaceElements(arr)
        
        XCTAssertEqual(result, [-1])
    }
}
