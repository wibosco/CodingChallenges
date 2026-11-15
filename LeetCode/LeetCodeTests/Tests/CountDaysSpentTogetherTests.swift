// Created 15/11/2026.

import Testing

@testable import LeetCode

struct CountDaysSpentTogetherTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let arriveAlice = "08-15"
        let leaveAlice = "08-18"
        
        let arriveBob = "08-16"
        let leaveBob = "08-19"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let arriveAlice = "08-15"
        let leaveAlice = "08-18"
        
        let arriveBob = "08-15"
        let leaveBob = "08-18"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 4)
    }
    
    @Test
    func test_C() {
        let arriveAlice = "10-01"
        let leaveAlice = "10-31"
        
        let arriveBob = "11-01"
        let leaveBob = "12-31"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 0)
    }
    
    @Test
    func test_D() {
        let arriveAlice = "01-15"
        let leaveAlice = "08-18"
        
        let arriveBob = "08-16"
        let leaveBob = "08-19"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 3)
    }
    
    @Test
    func test_E() {
        let arriveAlice = "01-15"
        let leaveAlice = "08-18"
        
        let arriveBob = "02-16"
        let leaveBob = "08-19"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 184)
    }
    
    @Test
    func test_F() {
        let arriveAlice = "10-20"
        let leaveAlice = "12-22"
        
        let arriveBob = "06-21"
        let leaveBob = "05-05"
        
        let result = CountDaysSpentTogether().countDaysTogether(arriveAlice, leaveAlice, arriveBob, leaveBob)
        
        #expect(result == 0)
    }
}
