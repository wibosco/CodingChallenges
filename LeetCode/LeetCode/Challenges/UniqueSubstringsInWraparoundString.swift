// Created 14/01/2026.

import Foundation

//https://leetcode.com/problems/unique-substrings-in-wraparound-string/
struct UniqueSubstringsInWraparoundString {
    
    //Time: O(n ^ 2) where n is the number of characters in `s`
    //Space: O(n ^ 2)
    //array
    //string
    //set
    //nested loops
    //two pointers
    //
    //Solution Description:
    //For each character in `s`, we find it's longest substring - when we reach a character that is out of sequence or we
    //reach the end of `s`, we move onto the next starting character of `s` and repeat the process. Each in sequence substring
    //we find is added to `uniqueSubstrings`. As `uniqueSubstrings` is a set we can't add the same substring twice. Once all
    //starting characters have been checked we return the count of `uniqueSubstrings`.
    func findSubstringInWraproundString(_ s: String) -> Int {
        let wrap: [Character: Character] = ["a": "b",
                                            "b": "c",
                                            "c": "d",
                                            "d": "e",
                                            "e": "f",
                                            "f": "g",
                                            "g": "h",
                                            "h": "i",
                                            "i": "j",
                                            "j": "k",
                                            "k": "l",
                                            "l": "m",
                                            "m": "n",
                                            "n": "o",
                                            "o": "p",
                                            "p": "q",
                                            "q": "r",
                                            "r": "s",
                                            "s": "t",
                                            "t": "u",
                                            "u": "v",
                                            "v": "w",
                                            "w": "x",
                                            "x": "y",
                                            "y": "z",
                                            "z": "a"]

        let chars = Array(s)
        
        var uniqueSubstrings = Set<[Character]>()

        var p1 = 0

        while p1 < chars.count {
            var substring = [chars[p1]]

            uniqueSubstrings.insert(substring)

            var p2 = p1 + 1

            while p2 < chars.count && wrap[chars[(p2 - 1)]]! == chars[p2] {
                substring.append(chars[p2])
                uniqueSubstrings.insert(substring)

                p2 += 1
            }

            p1 += 1
        }

        return uniqueSubstrings.count
    }
}
