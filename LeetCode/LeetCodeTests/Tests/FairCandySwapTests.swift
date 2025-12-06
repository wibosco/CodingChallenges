// Created 29/02/2024.


import XCTest

@testable import LeetCode

final class FairCandySwapTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let aliceSizes = [1,1]
        let bobSizes = [2,2]
            
        let result = FairCandySwap().fairCandySwap(aliceSizes, bobSizes)
        
        XCTAssertEqual(result, [1,2])
    }
    
    func test_B() {
        let aliceSizes = [1,2]
        let bobSizes = [2,3]
            
        let result = FairCandySwap().fairCandySwap(aliceSizes, bobSizes)
        
        XCTAssertEqual(result, [1,2])
    }
    
    func test_C() {
        let aliceSizes = [2]
        let bobSizes = [1,3]
            
        let result = FairCandySwap().fairCandySwap(aliceSizes, bobSizes)
        
        XCTAssertEqual(result, [2,3])
    }
    
    func test_D() {
        let aliceSizes = [31,1,13,66,56,47,3,76,10,70]
        let bobSizes = [41,88,10,36,5,94,62,34,17,90]
            
        let result = FairCandySwap().fairCandySwap(aliceSizes, bobSizes)
        
        XCTAssertEqual(result, [10,62])
    }
}
