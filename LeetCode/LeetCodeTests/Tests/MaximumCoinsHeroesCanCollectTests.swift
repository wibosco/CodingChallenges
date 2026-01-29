// Created 01/03/2024.

import XCTest

@testable import LeetCode

final class MaximumCoinsHeroesCanCollectTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let heroes = [1,4,2]
        let monsters = [1,1,5,2,3]
        let coins = [2,3,4,5,6]
        
        let result = MaximumCoinsHeroesCanCollect().maximumCoins(heroes, monsters, coins)
        
        XCTAssertEqual(result, [5,16,10])
    }
    
    func test_B() {
        let heroes = [5]
        let monsters = [2,3,1,2]
        let coins = [10,6,5,2]
        
        let result = MaximumCoinsHeroesCanCollect().maximumCoins(heroes, monsters, coins)
        
        XCTAssertEqual(result, [23])
    }
    
    func test_C() {
        let heroes = [4,4]
        let monsters = [5,7,8]
        let coins = [1,1,1]
        
        let result = MaximumCoinsHeroesCanCollect().maximumCoins(heroes, monsters, coins)
        
        XCTAssertEqual(result, [0,0])
    }
    
    func test_D() {
        let heroes = [36]
        let monsters = [23]
        let coins = [44]
        
        let result = MaximumCoinsHeroesCanCollect().maximumCoins(heroes, monsters, coins)
        
        XCTAssertEqual(result, [44])
    }
}
