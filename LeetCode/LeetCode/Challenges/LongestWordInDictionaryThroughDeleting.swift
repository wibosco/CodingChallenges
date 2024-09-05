//
//  LongestWordInDictionaryThroughDeleting.swift
//  LeetCode
//
//  Created by William Boles on 05/09/2024.
//

import Foundation

//https://leetcode.com/problems/longest-word-in-dictionary-through-deleting/
struct LongestWordInDictionaryThroughDeleting {
    
    //Time: O(n * m)) where n is the number of words in `dictionary`
    //                where m is the number of characters in a word
    //Space: O(m + s) where m is the number of characters in a word
    //                where s is the number of characters in `s`
    //array
    //string
    //two pointers
    //fast forward
    //subsequence
    //
    //Solution Description:
    //Iterating through the elements in `dictionary` we attempt to see if that element could be a subsequence of `s`. A
    //subsequence is a non-contiguous slice of an array i.e. while order is preserved some characters can be skipped over. We
    //use two pointers to iterate through `word` and `s` to determine if `word` is a subsequence of `s`. If `word` is a
    //subsequence of `s` we compare `word` against `longestWord` using a two tier approach: first we check length then if
    //`longestWord` and `word` have the same length we check lexicographical ordering. If `word` is either longer or of equal
    //length with a smaller lexicographical order then we set it as `longestWord`. We repeat this process for all elements in
    //`dictionary`. Once all elements have been checked we return `longestWord`.
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        var longestWord = ""
        
        for word in dictionary {
            guard word.count <= s.count else { //`word` can't be longer than `s`
                continue
            }
            
            if isSubsequence(word, of: s) {
                if (word.count > longestWord.count) || // longer word?
                    ((word.count == longestWord.count) && (word < longestWord)) { //same length but lexicographical smaller?
                    longestWord = word
                }
            }
        }
        
        return longestWord
    }
    
    private func isSubsequence(_ a: String, of b: String) -> Bool {
        let a = Array(a)
        let b = Array(b)
        
        var p1 = 0
        var p2 = 0
        
        while p1 < a.count {
            while p2 < b.count, a[p1] != b[p2] { //fast forward
                p2 += 1
            }
            
            p1 += 1
            p2 += 1
        }
        
        return p2 <= b.count
    }
}
