// Created 17/07/2023.

import Foundation

//https://leetcode.com/problems/merge-strings-alternately/
struct MergeStringsAlternately {
    
    //Time: O(n) where n is the larger of either `word1` or `word2`
    //Space: O(1)
    //array
    //two pointers
    //string
    //
    //Solution Description:
    //We iterate through `word1` and `word2` taking the character at same index from both and appending it to `merged`
    //(`word1` first). As `word1` and `word2` can have different lengths, our while loop stops merging once we reach the
    //end of either `word1` or `word2`. As it is still possible for characters to remain, we merge any remaining
    //characters in either `word1` or `word2` into `merged` and return it.
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let word1 = Array(word1)
        let word2 = Array(word2)
        
        var i = 0
        
        var merged = [Character]()
        
        while i < word1.count && i < word2.count {
            let c1 = word1[i]
            let c2 = word2[i]
            
            merged.append(c1)
            merged.append(c2)
                
            i += 1
        }
        
        merged.append(contentsOf: word1[i...])
        merged.append(contentsOf: word2[i...])
        
        return String(merged)
    }
}
