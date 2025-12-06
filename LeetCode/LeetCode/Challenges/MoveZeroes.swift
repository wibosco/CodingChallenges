// Created 18/11/2021.

import Foundation

//https://leetcode.com/problems/move-zeroes/
struct MoveZeros {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //sorting
    //pivot
    //
    //Solution Description:
    //Using a fast and slow pointer move through the array. The slow pointer is used to identify zero value; the fast pointer
    //used to identify non-zero values. With the slow pointer on a zero value and the fast pointer on a non-zero value, the
    //values are swapped - the ordering of the zeros isn't important so swapping the first zero is fine. This will result in
    //the zeros moving gradually moved to the end of the array as we partition the array.
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var slow = 0
        var fast = 1
        
        while fast < nums.count {
            if nums[slow] == 0 && nums[fast] != 0 {
                nums.swapAt(slow, fast)
                
                slow += 1
            } else if nums[slow] != 0 {
                slow += 1
            }
            
            fast += 1
        }
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //fast forward
    //
    //Solution Description:
    //Using two pointers we iterate through `nums`. When we encounter a zero, `p1` get left on that zero, `p2` continues on.
    //When `p2` encounters a non-zero, we check if `nums[p1]` is zero. If `nums[p1]` is a zero we swap the values of `p1` and
    //`p2` and then fast forward `p1` to either the next zero or to `p2` (as we know that `p2` is now zero). If `nums[p1]`
    //does not equal zero then `nums[p2]` is already in it's final position. We repeat this process until all elements in
    //`nums` have been process and can the exit.
    func moveZeroes2(_ nums: inout [Int]) {
        var p1 = 0
        var p2 = 0

        while p2 < nums.count {
            if nums[p2] != 0 && nums[p1] == 0 {
                nums.swapAt(p1, p2)

                while p1 < p2, nums[p1] != 0 {
                    //fast forward to next zero
                    p1 += 1
                }
            } else if nums[p1] != 0 {
                p1 += 1
            }

            p2 += 1
        }
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //removal
    //
    //Solution Description:
    //Remove zeros from `nums` as this are found while keeping a count of how many have been removed. Once all zeros have been
    //removed, add them to the end of the array.
    func moveZeroes3(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var zerosFound = 0
        var i = 0
        
        while i < nums.count {
            if nums[i] == 0 {
                nums.remove(at: i)
                zerosFound += 1
            } else {
                i += 1
            }
        }
        
        if zerosFound != 0 {
            let zeros = Array(repeating: 0, count: zerosFound)
            nums.append(contentsOf: zeros)
        }
    }
}
