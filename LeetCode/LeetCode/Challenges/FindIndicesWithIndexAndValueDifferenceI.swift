// Created 11/06/2024.

import Foundation

//https://leetcode.com/problems/find-indices-with-index-and-value-difference-i/
struct FindIndicesWithIndexAndValueDifferenceI {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //nested loops
    //
    //Solution Description:
    //Using two nested loops we iterate through each element in `nums` and compare it against all other elements. If we find a
    //combination of indexes and elements that satisify our requirements we return the indexes, other we continue iterating. If
    //we iterate through all elements and haven't found a match we return `[-1,-1]`.
    func findIndices(_ nums: [Int], _ indexDifference: Int, _ valueDifference: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if abs(i - j) >= indexDifference && abs(nums[i] - nums[j]) >= valueDifference {
                    return [i, j]
                }
            }
        }
        
        return [-1, -1]
    }
}
