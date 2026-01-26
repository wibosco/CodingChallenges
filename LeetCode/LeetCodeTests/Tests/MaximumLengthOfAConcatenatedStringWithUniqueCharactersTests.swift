// Created 26/01/2026.

import Testing

@testable import LeetCode

struct MaximumLengthOfAConcatenatedStringWithUniqueCharactersTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let arr = ["un","iq","ue"]
        
        let result = MaximumLengthOfAConcatenatedStringWithUniqueCharacters().maxLength(arr)
        
        #expect(result == 4)
    }
    
    @Test
    func test_B() {
        let arr = ["cha","r","act","ers"]
        
        let result = MaximumLengthOfAConcatenatedStringWithUniqueCharacters().maxLength(arr)
        
        #expect(result == 6)
    }
    
    @Test
    func test_C() {
        let arr = ["abcdefghijklmnopqrstuvwxyz"]
        
        let result = MaximumLengthOfAConcatenatedStringWithUniqueCharacters().maxLength(arr)
        
        #expect(result == 26)
    }
    
    @Test
    func test_D() {
        let arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
        
        let result = MaximumLengthOfAConcatenatedStringWithUniqueCharacters().maxLength(arr)
        
        #expect(result == 16)
    }
}
