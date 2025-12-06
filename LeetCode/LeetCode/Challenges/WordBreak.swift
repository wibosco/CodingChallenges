// Created 24/04/2023.

import Foundation

//https://leetcode.com/problems/word-break/
struct WordBreak {
    
    //Time: O(n^2) where n is the number of elements in `s`
    //Space: O(n + m) where n is the number of elements in `s`
    //                where m is the elements in `wordDict`
    //string
    //memoization
    //top-down
    //dynamic programming
    //DFS
    //recursive
    //
    //Solution Description:
    //Using DFS we iterate through `s` attempting to find a match for an element in `wordDict`. Once we find a match we then
    //recursively search for another match from `s[matchEndIndex...]` and we repeat this process until we run out of
    //characters in `s` to search. If immediately before running of character we found a match then we know that we can
    //successfully break `s` up into the elements of `wordDict` - we can determine this by checking if `startIndex` is outside
    //of `s.count`; if run out of characters without ending on a match then we know that `s` can not be broken up. As it is
    //possible for a sequence of characters to exist in `wordDict` as both a whole element and the prefix of an element e.g.
    //"cat" and "cats" - when searching if a recursive call comes back as false we don't abandon that search space until we
    //have exhausted `s` from that start index by adding more characters on to the word to be searched. To avoid traversing
    //the same branches on the search tree we store the outcome of a particular index in `memo`.
    //
    //N.B. We only store the branches in `memo` that result in a failed attempt to break `s` up. As soon as we find one branch
    //that results in a successful DFS we know that the result can be split up successfully.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        let wordSet = Set(wordDict)
        var memo = [Int: Bool]()

        return dfs(chars, wordSet, 0, &memo)
    }
    
    private func dfs(_ chars: [Character], _ wordSet: Set<String>, _ startIndex: Int, _ memo: inout [Int: Bool]) -> Bool {
        guard startIndex < chars.count else {
            return true
        }

        guard memo[startIndex] == nil else {
            return memo[startIndex]!
        }

        for j in (startIndex + 1)...chars.count { //our substring creation will ensure that we don't go over count
            let word = String(chars[startIndex..<j])
            
            //keep adding characters to `word` until we get a match with an element in `wordSet`. Once we have that
            //match, recursively search for the next word starting from the end of `word` - `j`. If searching from
            //`word` doesn't result in a full successful search then we add another character to `word` in case
            //`word` is part of another element in `wordSet` e.g. "cat" then becomes "cats" and repeat the process
            if wordSet.contains(word) && dfs(chars, wordSet, j, &memo) {
                return true
            }
        }

        //if we end up on `startIndex` again then we know it's not possible to split `chars` into elements in `wordSet`
        memo[startIndex] = false

        return false
    }
}
