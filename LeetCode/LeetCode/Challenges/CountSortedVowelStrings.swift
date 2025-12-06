// Created 11/05/2022.

import Foundation

//https://leetcode.com/problems/count-sorted-vowel-strings/
//string
struct CountSortedVowelStrings {
    
    //Time: O(n^5) where n is the length of the generated string, 5 is the number of possible choices at each index
    //Space: O(1)
    //DFS
    //recursive
    //backtracking
    //sorted
    //inout
    //
    //Solution Description:
    //Using DFS we and a sorted array `vowels`, we create all possible non-descending combinations of vowels for the given
    //length `n`. At each recursive call we start extracting elements from `vowels` at the `currentIndex` value which is the
    //previous calls index - this ensures that the combination that we are constructing is non-descending.
    func countVowelStrings(_ n: Int) -> Int {
        let vowels = ["a", "e", "i", "o", "u"]
        var count = 0
        
        dfs(n, vowels, 0, &count)
        
        return count
    }
    
    private func dfs(_ n: Int, _ vowels: [String], _ currentIndex: Int, _ count: inout Int) {
        guard n > 0 else {
            count += 1
            return
        }
        
        //start from the previous calls index to ensure non-descending order. It is fine for elements to repeat
        for i in currentIndex..<vowels.count {
            dfs((n - 1), vowels, i, &count)
        }
    }
}
