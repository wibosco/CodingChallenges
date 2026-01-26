// Created 26/01/2026.

import Foundation

//https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
struct MaximumLengthOfAConcatenatedStringWithUniqueCharacters {
    
    //Time: (2 ^ n) where n is the number of elements in `arr` (2 is because we either include the element or not)
    //
    //Space: O(n)
    //array
    //set
    //DFS
    //backtracking
    //inout
    //combinations
    //
    //Solution Description:
    //To allow for quick lookup as to if an element of `arr` contains elements that are already in our search string we first
    //convert each string element in `arr` to a character set. We then perform a DFS on those sets and build every possible
    //combination of the elements in `uniques`. For each element we only include it in our search string if that element's
    //characters are not included in `current` otherwise we skip over it. The ensure that we can search each possible
    //combination when we have exhausted all possible combinations from a given set we use backtracking to remove that
    //set from `current`. Each iteration through the DFS we compare the current length of `current` against `maxLength`, if
    //`current` is longer we update `maxLength`. Once all possible combinations of `arr` have been checked we return
    //`maxLength`.
    func maxLength(_ arr: [String]) -> Int {
        var uniques = [Set<Character>]()

        for str in arr {
            let unique = Set<Character>(str)

            if unique.count == str.count {
                uniques.append(unique)
            }
        }

        var maxLength = 0
        var current = Set<Character>()

        dfs(uniques, 0, &current, &maxLength)

        return maxLength
    }

    private func dfs(_ uniques: [Set<Character>], _ i: Int, _ current: inout Set<Character>, _ maxLength: inout Int) {
        maxLength = max(maxLength, current.count)

        //be careful when using `[i...].enumerated` as the index given out will start at 0 regardless of what `i` is,
        for j in i..<uniques.count {
            //only include uniques[j] if it's elements don't appear in `current`
            if current.intersection(uniques[j]).isEmpty {
                current.formUnion(uniques[j])
                dfs(uniques, (j + 1), &current, &maxLength)
                current.subtract(uniques[j])
            }
        }
    }
}
