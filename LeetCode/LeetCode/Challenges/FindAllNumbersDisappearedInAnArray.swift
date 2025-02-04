//
//  FindAllNumbersDisappearedInAnArray.swift
//  LeetCode
//
//  Created by William Boles on 07/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
//array
struct FindAllNumbersDisappearedInAnArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //marking
    //
    //Solution Description:
    //To avoid using extra storage we can update `nums` to indicate that an index is included by setting that value of
    //that index to be negative. We first iterate through `nums` and use the absolute value of the current index as the
    //index of the element that we want to "mark". We use the absolute value as it's possible the value at any given
    //index has already been marked so we need to be careful not to undo that. After the first iteration we then iterate
    //again and add any indexes that have a positive value to `disappearedNumbers` as that index isn't included as a
    //value of `nums`. Please note that as our output is expected to start at 1 we need to add or subtract 1 when
    //required.
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var disappearedNumbers = [Int]()
        var nums = nums
        
        for num in nums {
            //use the absolute value in case this index has already been "marked"
            let absNum = (abs(num) - 1) //as indexing starts at 1 to get the "true" index we subtract 1
            if absNum < nums.count {
                nums[absNum] = abs(nums[absNum]) * -1
            }
        }
        
        for (i, num) in nums.enumerated() {
            if num >= 0 {
                disappearedNumbers.append((i + 1)) //as indexing starts at 1 to get the output index we 1
            }
        }
        
        return disappearedNumbers
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //set
    //
    //Solution Description:
    //First we convert the `nums` array into a set to allow for O(1) retrieval time. We then iterate through the range 1...n
    //and check if that index is in the set `numsSet`. If that index is not in the set then we append it to
    //`disappearedNumbers`; if that index is in the set we skip over it.
    func findDisappearedNumbersExtraStorage(_ nums: [Int]) -> [Int] {
        var disappearedNumbers = [Int]()
        let numsSet = Set(nums)
        
        for i in 1...nums.count { //indexing starts at 1 so we do here
            guard !numsSet.contains(i) else {
                continue
            }
            
            disappearedNumbers.append(i)
        }
        
        return disappearedNumbers
    }
}
