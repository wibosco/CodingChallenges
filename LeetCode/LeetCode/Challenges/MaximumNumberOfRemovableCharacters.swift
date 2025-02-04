//
//  MaximumNumberOfRemovableCharacters.swift
//  LeetCode
//
//  Created by William Boles on 02/08/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-number-of-removable-characters/
struct MaximumNumberOfRemovableCharacters {
    
    //Time: O(log k * max(s, p)) where k is the number of elements in `removable`,
    //                           where s is the number of elements in `s`
    //                           where p is the number of elements in `p`
    //Space: O(s + p)
    //array
    //string
    //subsequence
    //two pointers
    //marking
    //nested loops
    //binary search
    //
    //Solution Description:
    //Using binary search we can iterate through `removable` and check if everything up to that element in removable results in `p`
    //still being a subsequence of `s`. When checking if `p` is still a subsequence we "mark" each index that we remove and then
    //using nested loops we iterate through `sub` and attempt for find a match for each character (in order) in `full`. Using two
    //pointers we are able to loop through both strings at different rates - remember a subsequence only needs to keep the relative
    //order of the elements the same, it can omit any elements in between. The outer loop iterates through the elements in `sub` and
    //the inner loop through `full`. If there is a match between `sub` and `full`, then we move onto the next element in `sub` and
    //attempt to find it in `full` - note that `fIndex` isn't reset upon finding a match. If we find all of `sub` in `full` then
    //`sIndex` will be equal to `sub.count` otherwise it won't be so we can use this to return true or false respectively. Knowing if
    //`p` is a subsequence of `s` for a given index of `removable` we then adjust the search space either left or right and repeat
    //the process until we run out of search space at which point we return `left`. 
    func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
        let p = Array(p)
        
        var left = 0
        var right = removable.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            var s = Array(s)
            for r in removable[0...mid] {
                s[r] = "0" //actually removing the element would change the indexes that follow
            }
            
            if isSubsequence(p, of: s) {
                left = mid + 1 //because the result is +1 to the left index, we add can +1 here
            } else {
                right = mid - 1
            }
        }
    
        return left
    }
    
    //Time: O(k * max(s, p)) where k is the number of elements in `removable`,
    //                       where s is the number of elements in `s`
    //                       where p is the number of elements in `p`
    //Space: O(s + p)
    //array
    //string
    //subsequence
    //two pointers
    //marking
    //nested loops
    //fast forward
    //
    //Solution Description:
    //Iterating through `removable` we "mark" each index that we remove and test if `p` is still a subsequence of this updated `s`.
    //Using nested loops we iterate through `sub` and attempt for find a match for each character (in order) in `full`. Using two
    //pointers we are able to loop through both strings at different rates - remember a subsequence only needs to keep the relative
    //order of the elements the same, it can omit any elements in between. The outer loop iterates through the elements in `sub` and
    //the inner loop through `full`. If there is a match between `sub` and `full`, then we move onto the next element in `sub` and
    //attempt to find it in `full` - note that `fIndex` isn't reset upon finding a match. If we find all of `sub` in `full` then
    //`sIndex` will be equal to `sub.count` otherwise it won't be so we can use this to return true or false respectively.
    func maximumRemovalsLinear(_ s: String, _ p: String, _ removable: [Int]) -> Int {
        var removed = 0
        var s = Array(s)
        let p = Array(p)
        
        for r in removable {
            s[r] = "0" //actually removing the element would change the indexes that follow
            
            if !isSubsequence(p, of: s) {
                break
            }
            
            removed += 1
        }
        
        return removed
    }
    
    private func isSubsequence(_ sub: [Character], of full: [Character]) -> Bool {
        var sIndex = 0
        var fIndex = 0
        
        while sIndex < sub.count {
            var match = false
            
            while fIndex < full.count && !match {
                match = (full[fIndex] == sub[sIndex])
                fIndex += 1
            }
            
            if !match {
                break
            }
            
            sIndex += 1
        }
        
        return sIndex == sub.count
    }
}
