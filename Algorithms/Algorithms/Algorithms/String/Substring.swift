// Created 11/07/2023.

import Foundation

struct Substring {
    
    // MARK: - Generation
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //DFS
    //recursive
    //array
    //subarray
    //string
    //set
    //multi-source
    //n-ary tree
    //
    //Solution Description:
    //A substring is contiguous slice of `s`. While order must be preserved (no elements skipped over), elements can be
    //dropped at either end of the array. Therefore to generate all substrings we need to iterate through all possible
    //starting indexes of `s` and take each starting position to the end of `s` - it's important to note that we only ever
    //move forwards, never backwards. Each new element we encounter we add to `substring` and store that addition in
    //`substrings` as it own unique string - a subarray doesn't need to use all elements in `arr`.
    //
    //Substrings of `abcd`
    //
    //    a
    //    b
    //    c
    //    d
    //    ab
    //    bc
    //    cd
    //    abc
    //    bcd
    //    abcd
    static func generateSubstrings(_ s: String) -> Set<String> {
        var substrings = Set<String>()
        let characters = Array(s)
        
        for i in 0..<characters.count {
            dfs(characters, i, [], &substrings)
        }
        
        return substrings
    }
        
    private static func dfs(_ characters: [Character], _ index: Int, _ substring: [Character], _ substrings: inout Set<String>) {
        guard index < characters.count else {
            return
        }
    
        let nextSubstring = substring + [characters[index]]
        substrings.insert(String(nextSubstring))
        dfs(characters, (index + 1), nextSubstring, &substrings)
    }
    
    //Time: O(n^3) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //subarray
    //string
    //nested loops
    //
    //Solution Description:
    //A substring is contiguous slice of `s`. While order must be preserved (no elements skipped over), elements can be
    //dropped at either end of the array. Therefore to generate all substrings we need to iterate through all possible
    //starting indexes of `s` and take each starting position to the end of `s` - it's important to note that we only ever
    //move forwards, never backwards. Each new element we encounter we generate a new `substring` and store that addition in
    //`substrings` as it own unique string - a subarray doesn't need to use all elements in `arr`.
    //
    //Substrings of `abcd`
    //
    //    a
    //    b
    //    c
    //    d
    //    ab
    //    bc
    //    cd
    //    abc
    //    bcd
    //    abcd
    static func generateSubstringsUsingNestedForLoops(_ s: String) -> [String] {
        var substrings = [String]()
        let characters = Array(s)
        
        for i in 0..<characters.count {
            for j in i..<characters.count {
                let substring = Array(characters[i...j])
                substrings.append(String(substring))
            }
        }
        
        return substrings
    }
    
    // MARK: - Count
    
    //Time: O(1)
    //Space: O(1)
    //math
    //
    //Solution Description:
    //Use a formula to work out the count.
    static func countSubstrings(_ s: String) -> Int {
        let characterCount = s.count
        
        return characterCount * (characterCount + 1) / 2
    }
}
