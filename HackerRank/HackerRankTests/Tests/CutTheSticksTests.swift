// Created 08/05/2016.


import XCTest

@testable import HackerRank

final class CutTheSticksTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        let sticks = [5, 4, 4, 2, 2, 8]
        
        let sticksRemainingForEachCut = CutTheSticks.cutUntilDone(sticks: sticks)
        
        XCTAssertEqual([6, 4, 2, 1], sticksRemainingForEachCut)
    }
    
    func test_B() {
        
        let sticks = [1, 2, 3, 4, 3, 3, 2, 1]
        
        let sticksRemainingForEachCut = CutTheSticks.cutUntilDone(sticks: sticks)
        
        XCTAssertEqual([8, 6, 4, 1], sticksRemainingForEachCut)
    }
}
