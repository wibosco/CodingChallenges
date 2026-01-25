// Created 25/01/2026.

import Testing

@testable import LeetCode

struct FriendsOfAppropriateAgesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let ages = [16,16]
        
        let result = FriendsOfAppropriateAges().numFriendRequests(ages)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let ages = [16,17,18]
        
        let result = FriendsOfAppropriateAges().numFriendRequests(ages)
        
        #expect(result == 2)
    }
    
    @Test
    func test_C() {
        let ages = [20,30,100,110,120]
        
        let result = FriendsOfAppropriateAges().numFriendRequests(ages)
        
        #expect(result == 3)
    }
    
    @Test
    func test_D() {
        let ages = [8,85,24,85,69]
        
        let result = FriendsOfAppropriateAges().numFriendRequests(ages)
        
        #expect(result == 4)
    }
    
    @Test
    func test_E() {
        let ages = [73,106,39,6,26,15,30,100,71,35,46,112,6,60,110]
        
        let result = FriendsOfAppropriateAges().numFriendRequests(ages)
        
        #expect(result == 29)
    }
}
