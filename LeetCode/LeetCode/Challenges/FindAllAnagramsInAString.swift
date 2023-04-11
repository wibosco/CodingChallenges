//
//  FindAllAnagramsInAString.swift
//  LeetCode
//
//  Created by William Boles on 02/02/2022.
//

import Foundation

//https://leetcode.com/problems/find-all-anagrams-in-a-string/
//array
struct FindAllAnagramsInAString {
    
    //Time: O(n) `n` is the number of characters in `s`
    //Space: O(1) as `pCount` or `sCount` can only hold a max of 26 characters (English alphabet)
    //sliding window
    //strings
    //
    //Solution Description:
    //Using a sliding window approach we are able to iterate through the `s` string checking if any squence of
    //characters of length `p` are anagrams of `p`. A sliding window works by moving through the array in a
    //linear fashion and having elements move into our inspection window from the right and move out of our
    //inspection window from the left. Below we use a window dictionary `sCount` to compare the elements in
    //the current window against our static `pCount` dictionary. These dictionaries contain both the characters
    //and the frequency with which they occurred. If both dictionaries match then it means that we have anagram
    //in that window and we add the left most element's index to the `indexes` array. Once we have iterated
    //through all characters in `s` we return the indexes that we have founds
    static func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let ns = s.count //calling `count` is an O(n) operation so pulling it out to speed things up
        let np = p.count
        
        guard np <= ns else {
            return [Int]()
        }
        
        var pCount = [Character: Int]()
        var sCount = [Character: Int]()
        
        for c in p {
            pCount[c, default: 0] += 1
        }
        
        var indexes = [Int]()
        let characters = Array(s)
        
        var left = 0
        var right = 0
        
        while right < ns { //has the window reached its full length
            let rightCharacter = characters[right]
            sCount[rightCharacter, default: 0] += 1
            
            if right >= np {
                let leftCharacter = characters[left]
                if let count = sCount[leftCharacter] { //remove the left element from `sCount`
                    if count == 1 {
                        sCount[leftCharacter] = nil //no more instances of `leftCharacter` exist
                    } else {
                        sCount[leftCharacter] = count - 1
                    }
                }
                
                left += 1 //move the left pointer right
            }
            
            if sCount == pCount {
                indexes.append(left)
            }
            
            right += 1
        }

        return indexes
    }
}
