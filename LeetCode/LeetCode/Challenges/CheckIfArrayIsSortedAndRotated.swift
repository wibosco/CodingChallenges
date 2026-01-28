// Created 28/01/2026.

import Foundation

//https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
struct CheckIfArrayIsSortedAndRotated {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //First we find the element where the array was rotated. Then treating the array as two arrays - before the pivot and after
    //the pivot - we ensure that each array is in non-descending order in two seperate loops. To ensure that "before the pivot"
    //array follows on from the "after the pivot" array we don't compare the current array element against it's immediate
    //predesscor but rather against `prev` to allow the two loops to be linked together. If `prev` is ever greater than the
    //current `nums` value we return `false`. If after iterating through both arrays all elements are in non-descending order
    //we return `true`
    func check(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }

        var pivot = 0
        var p1 = 1

        while p1 < nums.count {
            if nums[(p1 - 1)] > nums[p1] {
                pivot = p1
                break
            }

            p1 += 1
        }

        var prev = -1
        for num in nums[pivot...] {
            if prev > num {
                return false
            }

            prev = num
        }

        for num in nums[0..<pivot] {
            if prev > num {
                return false
            }

            prev = num
        }

        return true
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //
    //
    //Solution Description:
    //If we concatenate `nums` to itself then if `nums` is valid we will have at least one subarray that is in non-descending
    //order. So we loop through this doubled `nums` and when the elements are are in non-descending order we increment
    //`currentNonDescendingLength`, if `currentNonDescendingLength` ever reaches `validNonDescendingLength` length then we
    //know that `nums` is valid and can return true. If we reach the end of `nums` we can return false as we know it isn't
    //valid.
    func check2(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        
        let validNonDescendingLength = nums.count
        
        let nums = nums + nums
        
        var currentNonDescendingLength = 1
        var p1 = 1
        while p1 < nums.count {
            if nums[(p1 - 1)] > nums[p1] {
                currentNonDescendingLength = 1
            } else {
                currentNonDescendingLength += 1
            }
            
            if currentNonDescendingLength == validNonDescendingLength {
                return true
            }
            
            p1 += 1
        }
        
        return false
    }
}
