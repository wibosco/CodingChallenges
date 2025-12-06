// Created 09/07/2023.


import XCTest

@testable import LeetCode

final class MaximumNumberOfBalloonsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let text = "nlaebolko"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let text = "loonbalxballpoon"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let text = "leetcode"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let text = "baloon"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_E() {
        let text = "ballon"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_F() {
        let text = "balllllllllllloooooooooon"
        
        let result = MaximumNumberOfBalloons().maxNumberOfBalloons(text)
        
        XCTAssertEqual(result, 1)
    }
}
