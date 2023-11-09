//
//  SortCharactersByFrequency.swift
//  LeetCode
//
//  Created by William Boles on 11/04/2022.
//

import Foundation

//https://leetcode.com/problems/sort-characters-by-frequency/
struct SortCharactersByFrequency {
    
    //Time: O(k + n) where k is the number of unique characters in `s`
    //               where n is the number of characters in `s`
    //Space: O(k + n)
    //string
    //dictionary
    //sorting
    //bucket sort
    //
    //Solution Description:
    //Using a dictionary (`frequency`) we count all the occurrences of any given character in `s`. We then sort the keys
    //in `frequency` into buckets (multiple keys can be in the same bucket). We then iterate through our buckets (in
    //reverse order as we want a descending result) and add each key into the `result` array the number that bucket
    //represents
    static func frequencySort(_ s: String) -> String {
        var frequency = [Character: Int]()
        var maxFrequency = 0
        
        for c in s {
            frequency[c, default: 0] += 1
            
            maxFrequency = max(maxFrequency, frequency[c]!)
        }
        
        var buckets = Array(repeating: [Character](), count: (maxFrequency + 1))
        
        for (key, value) in frequency {
            buckets[value].append(key)
        }
        
        var result = [Character]()
        
        for i in (0..<buckets.count).reversed() {
            for c in buckets[i] {
                result += Array(repeating: c, count: i)
            }
        }
        
        return String(result)
    }
    
    //Time: O(n + k log k) where k is the number of unique characters in `s`
    //                     where n is the number of characters in `s`
    //Space: O(k + n)
    //string
    //dictionary
    //sorting
    //
    //Solution Description:
    //Using a dictionary (`frequency`) we count all the occurrences of any given character in `s`. We then sort `frequency`
    //so that the elements are return in descending order. Iterating through the sorted `frequency` dictionary we
    //reassemble `s` in sorted fashion
    static func frequencySortDictionary(_ s: String) -> String {
        var frequency = [Character: Int]()
        
        for c in s {
            frequency[c, default: 0] += 1
        }
        
        let sortedFrequency = frequency.sorted { $0.value > $1.value }
        
        var result = [Character]()
        
        for (key, value) in sortedFrequency {
            let characters = Array(repeating: key, count: value)
            
            result += characters
        }
        
        return String(result)
    }
}
