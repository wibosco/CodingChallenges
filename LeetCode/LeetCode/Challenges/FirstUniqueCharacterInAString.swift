// Created 14/11/2026.

import Foundation

//https://leetcode.com/problems/first-unique-character-in-a-string/
struct FirstUniqueCharacterInAString {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //counting
    //dictionary
    //
    //Solution Description:
    //First we iterate through `s` and populate a dictionary with the character as the key and each index that characters appears
    //at being the stored in an array as the value. We then iterate back through `s` again and the first character we
    //encounter that has an array of count 1, we return that index.
    func firstUniqChar(_ s: String) -> Int {
        var map = [Character: [Int]]()

        for (i, c) in s.enumerated() {
            map[c, default: [Int]()].append(i)
        }

        for c in s {
            if let indexes = map[c], indexes.count == 1 {
                return indexes[0]
            }
        }

        return -1
    }
}
