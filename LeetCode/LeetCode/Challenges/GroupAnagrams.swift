//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by William Boles on 11/03/2022.
//

import Foundation

//https://leetcode.com/problems/group-anagrams/
struct GroupAnagrams {
    
    //Time: O(n m log m) where n is the number of elements in `strs`
    //                   where m is max character length
    //Space: O(n) where n is the number of elements in `strs`
    //string
    //sorting
    //dictionary
    //
    //Solution Description:
    //If one string is an anagram of another it will contain the exact same characters just in a different order. Rather go through each
    //`strs` element and compare against each other one, we instead sort each element and use that sorted string as the key of a
    //dictionary. This way if two strings are anagrams they will be sorted to the same string and we can add them to the dictionary as
    //elements of the value array.
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard strs.count > 1 else {
            return [strs]
        }
        
        var grouping = [[Character]: [String]]()
        for str in strs {
            let key = str.sorted()
            
            grouping[key, default: [String]()].append(str)
        }
        
        return grouping.values.map { Array($0) }
    }
}
