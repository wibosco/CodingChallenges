// Created 30/07/2025.

import Testing

@testable import LeetCode

struct StrobogrammaticNumberIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 2
        
        let result = StrobogrammaticNumberII().findStrobogrammatic(n)
        
        let expectedValues = ["11","69","88","96"]
        
        #expect(result.count == expectedValues.count)
        
        //order isn't important
        for value in expectedValues {
            #expect(result.contains(value))
        }
    }
    
    @Test
    func test_B() {
        let n = 1
        
        let result = StrobogrammaticNumberII().findStrobogrammatic(n)
        
        let expectedValues = ["0","1","8"]
        
        #expect(result.count == expectedValues.count)
        
        //order isn't important
        for value in expectedValues {
            #expect(result.contains(value))
        }
    }
    
    @Test
    func test_C() {
        let n = 4
        
        let result = StrobogrammaticNumberII().findStrobogrammatic(n)
        
        let expectedValues = ["1001","1111","1691","1881","1961","6009","6119","6699","6889","6969","8008","8118","8698","8888","8968","9006","9116","9696","9886","9966"]
        
        #expect(result.count == expectedValues.count)
        
        //order isn't important
        for value in expectedValues {
            #expect(result.contains(value))
        }
    }
}
