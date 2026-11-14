// Created 28/01/2026.

import Foundation

//https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
struct CheckIfArrayIsSortedAndRotated {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //If we treat `nums` as circular, so that the last element is followed by the first, a sorted array that has been
    //rotated has at most one point where an element is greater than the element after it - this is where the end of the
    //original array meets its start. We iterate through `nums`, comparing each element with the previous one, and count
    //every point where the previous element is greater than the current element - storing this count in `changes`. We then
    //complete the circle by comparing the last element with the first, counting that point too if the last element is
    //greater. If `nums` is sorted but not rotated, the only change is at the join between the last and first elements. If
    //`nums` is rotated, the only change is inside the array and the join is in order. If every element is equal, there are
    //no changes at all. So if `changes` is at most 1, `nums` is a rotated sorted array and we return true; otherwise we
    //return false.
    func check(_ nums: [Int]) -> Bool {
        var changes = 0

        for i in 1..<nums.count  {
            if nums[i - 1] > nums[i] {
                changes += 1
            }
        }

        if nums[nums.count - 1] > nums[0] {
            changes += 1
        }

        return changes <= 1
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //A sorted array that has been rotated has at most one point where an element is greater than the element after it -
    //this is where the end of the original array meets its start. We iterate through `nums`, comparing each element with
    //the previous one. If the previous element is greater than the current element, we have found that point and set
    //`changed` to true. If we then find a second such point, `nums` can't be a rotated sorted array, so we return false.
    //Once the iteration finishes, there are two possibilities. If `changed` is still false, `nums` is already in sorted
    //order, so we return true. If `changed` is true, `nums` has been rotated, so the last element must wrap around to the
    //first element in order - i.e. the last element must be less than or equal to the first element.
    func check2(_ nums: [Int]) -> Bool {
        var changed = false

        for i in 1..<nums.count {
            if nums[(i - 1)] > nums[i] {
                guard !changed else {
                    return false
                }

                changed = true
            }
        }

        return !changed || nums[nums.count - 1] <= nums[0]
    }
    
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
    func check3(_ nums: [Int]) -> Bool {
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
            //`prev` is carred over from previous loop to ensuring continuity between nums.last and nums.first
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
    //Solution Description:
    //If we concatenate `nums` to itself then if `nums` is valid we will have at least one subarray that is in non-descending
    //order. So we loop through this doubled `nums` and when the elements are are in non-descending order we increment
    //`currentNonDescendingLength`, if `currentNonDescendingLength` ever reaches `validNonDescendingLength` length then we
    //know that `nums` is valid and can return true. If we reach the end of `nums` we can return false as we know it isn't
    //valid.
    func check4(_ nums: [Int]) -> Bool {
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
