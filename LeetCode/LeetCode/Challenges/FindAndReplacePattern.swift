// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/find-and-replace-pattern/
struct FindAndReplacePattern {
    
    //Time: O(n * m) where n is the number of elements in `words`
    //               where m is the number of characters in `pattern`
    //Space: O(n + m)
    //dictionary
    //string
    //isomorphic
    //
    //Solution Description:
    //Using two dictionaries we can ensure that the characters in each element in `word` are consistently mapped to the
    //same character in `pattern` and vice-versa. It is neccessarily to have to seperate mappings from `word` to `pattern`
    //and `pattern` to `word` as a character in `word` might map to a different character in `pattern`, than the same
    //character in `pattern` maps to in `word` e.g.
    //
    // s = "paper", t = "title"
    //
    //In the above example, the `e` in `word` maps to `l` in `pattern` however the `e` in `pattern` maps to `r` in `word`.
    //
    //Using one pointer, `i`, we iterate through both `word` and `pattern` and use the characters we find at each index to
    //compare against any previous times we have encountered those character. If we have previously encountered those
    //characters we add them to `aToBPairing` and `bToAPairing` with the correct key and value configuration; if we have
    //previously encountered either of those characters we check to make sure it was in the presence of both the characters,
    //if either mapping is to a different character we return `false`. After iterating through both strings we return `true`
    //if they consistently match we can add them to `matches`. Once all elements have been compared to `pattern` we can
    //return `matches`.
    //
    //Similar to: https://leetcode.com/problems/isomorphic-strings/
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var matches = [String]()

        for word in words {
            if isIsomorphic(word, pattern) {
                matches.append(word)
            }
        }

        return matches
    }

    private func isIsomorphic(_ a: String, _ b: String) -> Bool {
        let aChars = Array(a)
        let bChars = Array(b)

        var aToBPairing = [Character: Character]()
        var bToAPairing = [Character: Character]()

        var i = 0

        while i < aChars.count { //could have been bChars as they are the same length
            let aC = aChars[i]
            let bC = bChars[i]

            if aToBPairing[aC] == nil && bToAPairing[bC] == nil {
                aToBPairing[aC] = bC
                bToAPairing[bC] = aC
            } else if !(aToBPairing[aC] == bC && bToAPairing[bC] == aC) {
                return false
            }

            i += 1
        }

        return true
    }
}
