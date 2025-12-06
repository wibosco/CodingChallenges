// Created 05/06/2024.

import Foundation

//https://leetcode.com/problems/reverse-prefix-of-word
struct ReversePrefixOfWord {
    
    //Time: O(n) where n is the number of characters in `word`
    //Space: O(n)
    //string
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `word` attempting to find the first instance of `ch`. If we never find `ch`, we
    //simply return `word` as there is nothing to be reversed; if we do find  `ch` then `p1` will have a value of 0 and `p2`
    //will be at the index of `ch`. We then swap the character at `p1` with the character at `p2` then increment `p1` and
    //decrement `p2` and repeat the swap, we do this while `p1` remains less than `p2` - once `p1` is equal to `p2` we know
    //that all characters have been swapped. We then return the rearranged `word`.
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        let p1 = 0
        var p2 = 0
        
        var characters = Array(word)
        
        while p2 < characters.count {
            if characters[p2] == ch {
                reverse(left: p1, right: p2, characters: &characters)
                break
            }
            
            p2 += 1
        }
        
        return String(characters)
    }
    
    private func reverse(left: Int, right: Int, characters: inout [Character]) {
        var p1 = left
        var p2 = right
        
        while p1 < p2 {
            let temp = characters[p1]
            characters[p1] = characters[p2]
            characters[p2] = temp
            
            p1 += 1
            p2 -= 1
        }
    }
}
