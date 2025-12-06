// Created 22/05/2022.

import Foundation

struct BubbleSort {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //sorting
    //bubble sort
    //
    //Solution Description:
    //Using bubble sort we compare adjacent elements in `nums` and swap them if they are out of order. As we are only swapping
    //adjacent elements in order to get each element into its sorted position we may need to make multiple passes. In order to
    //know when `nums` is sorted, at the start of each pass through we set `sorted` to true. If `sorted` remains true after
    //passing through each element in `nums` then we know that `nums` is sorted and can stop looping; if `sorted` is false then
    //we know that at some point the previous loop we swapped elements and need to check again.
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var sorted = false
        var nums = nums
        
        while !sorted {
            sorted = true
            
            for i in 1..<nums.count {
                if nums[(i - 1)] > nums[i] {
                    nums.swapAt((i - 1), i)
                    sorted = false
                }
            }
        }
        
        return nums
    }
}
