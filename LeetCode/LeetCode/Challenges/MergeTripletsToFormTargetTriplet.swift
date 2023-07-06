//
//  MergeTripletsToFormTargetTriplet.swift
//  LeetCode
//
//  Created by William Boles on 04/07/2023.
//

import Foundation

//https://leetcode.com/problems/merge-triplets-to-form-target-triplet/
//array
struct MergeTripletsToFormTargetTriplet {
    
    //Time: O(n) where n is the number of elements in `triplets`
    //Space: O(1)
    //greedy
    //
    //Solution Description:
    //The secret here to the spot that in order to match `target` we can firstly only deal with elements from `triplets` that
    //contain values that are less than the values in `target` (in all positions), and secondly we don't need to actually
    //create each combination of `triplets` we instead only to find the exact values of `target` in the same position of
    //those filtered/valid triplets. Finding those exact matches tells us that we would eventually manage to combine the
    //triplets into `target`.
    static func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var foundFirstMatch = false
        var foundSecondMatch = false
        var foundThirdMatch = false
        
        for triplet in triplets {
            if triplet[0] <= target[0] &&
                triplet[1] <= target[1] &&
                triplet[2] <= target[2] {

                if triplet[0] == target[0] {
                    foundFirstMatch = true
                }
                
                if triplet[1] == target[1] {
                    foundSecondMatch = true
                }
                
                if triplet[2] == target[2] {
                    foundThirdMatch = true
                }
                
                if foundFirstMatch && foundSecondMatch && foundThirdMatch {
                    return true
                }
            }
        }
        
        return false
    }
}
