// Created 03/05/2025.

import Foundation

//https://leetcode.com/problems/ransom-note/
struct RansomNote {
    
    //Time: O(n + m) where n is the number of characters in `magazine`
    //               where m is the number of characters in `ransomNote`
    //Space: O(m) where n is the number of characters in `magazine`
    //string
    //array
    //dictionary
    //count
    //
    //Solution Description:
    //First we iterate through `magazine` and count each appearance of each character. Then we iterate through each character
    //in `ransomNote` and check if that character appears in `magzine` via the `counts` dictionary. If that character appears
    //and all appearances haven't been used we decrement that appearance count of that character and move onto the next; if
    //that character does not appear or has all appearances have already been used we return `false`. If we get to the end of
    //`ransonNote` without returning `false`, we return `true`.
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var counts = [Character: Int]()

        for c in magazine{
            counts[c, default: 0] += 1
        }

        for c in ransomNote {
            guard let count = counts[c], count > 0 else {
                return false
            }

            counts[c] = count - 1
        }

        return true
    }
}
