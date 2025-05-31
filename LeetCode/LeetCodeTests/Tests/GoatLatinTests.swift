// Created 31/05/2025.

import Testing

@testable import LeetCode

struct GoatLatinTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let sentence = "I speak Goat Latin"
        
        let result = GoatLatin().toGoatLatin(sentence)
        
        #expect(result == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa")
    }
    
    @Test
    func test_B() {
        let sentence = "The quick brown fox jumped over the lazy dog"
        
        let result = GoatLatin().toGoatLatin(sentence)
        
        #expect(result == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa")
    }
}
