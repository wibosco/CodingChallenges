//
//  NextGreaterElementIII.swift
//  LeetCode
//
//  Created by William Boles on 05/09/2024.
//

import Foundation

//https://leetcode.com/problems/next-greater-element-iii/
struct NextGreaterElementIII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //inline
    //permutation
    //pivot & swap
    //
    //Solution Description:
    //The next greater element is the next permutation of `n` that is the smallest version that is greater than `n`. To find
    //this "smallest greater than" permutation we need to find an element that when swapped with another minimally increases
    //`n` in value. The element that minimally increases `n` in value is the left-most element that when reading from right 
    //to left is smaller than it's right neighbor i.e. the elements to it's right are in ascending order (right to left) and
    //this element breaks that order e.g.
    //
    //In `834762` the `4` is that value
    //
    //We call this breaking pattern element the `pivot`. Once we have the `pivot` we need to find the smallest value that is
    //greater than it to swap over - this is to minimise the increase in `n`. You might be thinking if everything to the
    //right of `pivot` is ascending won't that smallest value be the last digit in `n` - be careful here, just because the 
    //`pivot` is smaller than it's neighor doesn't mean that it is smaller than all elements to the right and swapping the
    //`pivot` with an element smaller than itself would not result in the smallest permutation of `n` greater than `n` but
    //rather a smaller permutation of `n` e.g.
    //
    //In `834762` we don't want to swap the `4` with the `2` as `832764` < `834762` instead we want to swap it with the `6`
    //
    //So having swapped the `pivot` with the smallest right neighbor that is still greater than the `pivot` e.g.
    //
    //`836742`
    //
    //we can still make this number smaller by reversing those ascending numbers to the right of the old `pivot` index to
    //descending order e.g.
    //
    //`836247`
    //
    //With our smallest permutation we just need to check that it isn't larger than Int32.max and return either it or -1.
    //
    //Similar to https://leetcode.com/problems/next-permutation/
    func nextGreaterElement(_ n: Int) -> Int {
        guard n > 9 else {
            return -1
        }
        
        var nums = Array(String(n))
        
        //find the least significant value that is smaller than it's right neighbor
        var pivot = nums.count - 2
        while pivot >= 0, nums[(pivot + 1)] <= nums[pivot] {
            pivot -= 1
        }
        
        guard pivot >= 0 else {
            //`n` is already as large as it can be
            return -1
        }
        
        //find the least-significant-value to the right of the pivot that is larger than the pivot as we want
        //`nums` to be > `n`
        var lsv = nums.count - 1
        while lsv > 0, nums[lsv] <= nums[pivot] {
            lsv -= 1
        }
        nums.swapAt(pivot, lsv)
        
        //now the pivot is moved into place making `nums` > `n` we need to minimise `nums` so it's as small
        //as can be while still > `n`
        nums[(pivot + 1)...].reverse()
        
        guard let num32 = Int32(String(nums)) else { //casting to Int32 as problem expects Int32
            return -1
        }
        
        let num = Int(num32) //casting to Int to make comparison easier with `n`
        
        return num > n ? num : -1
    }
}
