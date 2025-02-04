//
//  UniqueLength3PalindromicSubsequences.swift
//  LeetCode
//
//  Created by William Boles on 10/07/2023.
//

import Foundation

//https://leetcode.com/problems/unique-length-3-palindromic-subsequences/

struct UniqueLength3PalindromicSubsequences {
    
    //Time: O(26*n) where n is the number of elements in `s`, 26 is the size of the English alphabet which is the max
    //              `leftEdgeOptions` hold
    //Space: O(n)
    //array
    //set
    //dictionary
    //frequency
    //nested loops
    //
    //Solution Description:
    //Rather finding the palindrome edges first, in this approach we the the center and attempt to find edges to sandwich it.
    //We do this sandwiching by first building a frequency table of all the characters in `s` - `rightEdgeOptions`. As we
    //iterate through `s` a second time, `rightEdgeOptions` will hold all the possible characters that we can choose from to
    //the right of the current character - `mid`, `leftEdgeOptions` will hold all the possible characters to choose from to
    //the left of `mid`. As we iterate through `s`, we remove one instance of `mid` from `rightEdgeOptions` by decrementing
    //it's count. We then search through all possible elements in `leftEdgeOptions` i.e. those characters that are to the left
    //of `mid`, and attempt to find an instance of that same character in `rightEdgeOptions` i.e. those characters that are to
    //the right of `mid`. If `l` exists both left and right of `mid` then we have a palindrome and can add it to our
    //`palindromes` set. We then add `mid` to `leftEdgeOptions` so that it can be used as an edge in the future, if needed.
    //Finally we return the count of all unique palindromes found.
    //
    //N.B. `rightEdgeOptions` is a dictionary because when removing an element from the right we only want to remove one
    //instance of `mid` as our search space (the elements of `leftEdgeOptions`) may not yet contain a copy of all the unique
    //characters that can fall between all combinations of `l` in `s` e.g. `abaca`, here at first when producing palindromes
    //with `a` as the edge our search space only contains `b` however you can see that the second right edge of `a` contains
    //`c`. With `leftEdgeOptions` we don't track the count of the character as any instance of `l` can be used to sandwich
    //`mid`.
    func countPalindromicSubsequence(_ s: String) -> Int {
        var rightEdgeOptions = [Character: Int]()
        
        for c in s {
            rightEdgeOptions[c, default: 0] += 1
        }
        
        var palindromes = Set<String>()
        var leftEdgeOptions = Set<Character>()
                
        for mid in s {
            //remove mid from possible characters that can be chosen as the right character of a palindrome
            rightEdgeOptions[mid, default: 0] -= 1
            
            for l in leftEdgeOptions { //regardless of the distance between the palindrome edges, this inner will only run 26 times
                if leftEdgeOptions.contains(l) && rightEdgeOptions[l, default: 0] > 0 {
                    let palindrome = "\(l)\(mid)\(l)"
                    palindromes.insert(palindrome)
                }
            }
            
            //move mid into the possible characters that can be chosen at as the left character of a palindrome
            leftEdgeOptions.insert(mid)
        }
        
        return palindromes.count
    }
    
    //Time: O(n^2) where n is the number of elements in `s`
    //Space: O(n)
    //array
    //set
    //dictionary
    //nested loops
    //
    //Solution Description:
    //First we iterate through `s` to determine the start and end indexes of all matching characters - we are only interested
    //in the start and end indexes as matches in-between will result in the same palindrome (matching palindromes are
    //discarded). We then iterate through those characters that occur at least twice in `s` and add each character that falls
    //between the start and end index to the `palindromes` set. At the end of each pairing we add the count of unique
    //palindromes to `count`.
    func countPalindromicSubsequenceNested(_ s: String) -> Int {
        var ranges = [Character: (Int, Int?)]()
        let characters = Array(s)
        
        for (i, c) in characters.enumerated() {
            if let range = ranges[c] {
                ranges[c] = (range.0, i)
            } else {
                ranges[c] = (i, nil)
            }
        }
        
        var count = 0
        for range in ranges.values {
            guard let end = range.1, end - range.0 > 1 else {
                continue
            }
            
            var start = range.0 + 1
            var palindromes = Set<Character>()
            
            while start < end {
                let mid = characters[start]
                palindromes.insert(mid) //only need to care about the mid character as left and right don't change
                
                start += 1
            }
            
            count += palindromes.count
        }
        
        return count
    }
}
