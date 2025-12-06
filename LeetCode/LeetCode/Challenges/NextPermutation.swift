// Created 14/11/2021.

import Foundation

//https://leetcode.com/problems/next-permutation/
struct NextPermutation {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //inline
    //permutation
    //pivot & swap
    //backtracking (virutal not actual)
    //
    //Solution Description:
    //To find the next permutation we need to find an element that when swapped with another minimally increases `nums` in
    //value. The element that minimally increases `n` in value is the left-most element that when reading from right to
    //left is smaller than it's right neighbor i.e. the elements to it's right are in ascending order (right to left) and
    //this element breaks that order e.g.
    //
    //In `834762` the `4` is that value
    //
    //We call this breaking order element the `pivot`. This `pivot` is what we want to change because a descending subarray
    //to the right shows that all permutations with the `pivot` as the root have been exhausted and that the root of this
    //tree now needs to be changed for it's next element which must exist to the right as there are larger values there.
    //Remember that when performing a DFS there is an order to how you choose the next element - this order is the same for
    //every permutation. Think of it like backtracking, once all possible subtrees have been built we move the root onto the
    //next element (which is the smallest value in the search space to the right) as in DFS we would be looping over the
    //neighbors. Once we have the `pivot` we need to find the smallest value that is greater than it to swap over - this is
    //to minimise the increase in `n`. You might be thinking if everything to the right of `pivot` is ascending won't that
    //smallest value be the last digit in `n` - be careful here, just because the `pivot` is smaller than it's neighor
    //doesn't mean that it is smaller than all elements to the right and swapping the `pivot` with an element smaller than
    //itself would not result in the smallest permutation of `n` greater than `n` but rather a smaller permutation of `n`
    //e.g.
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
    //See: https://www.youtube.com/watch?v=quAS1iydq7U
    //Similar to: https://leetcode.com/problems/next-greater-element-iii/
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        //find the least significant value that is smaller than it's right neighbor
        var pivot = nums.count - 2
        while pivot >= 0, nums[(pivot + 1)] <= nums[pivot] {
            pivot -= 1
        }
        
        if pivot >= 0 {
            //we know that `(pivot + 1)...` is descending so first `nums[lsv]` is the smallest value greater than
            //`nums[pivot]` i.e the next permutation for the value at index `pivot`
            var lsv = nums.count - 1
            while lsv > pivot, nums[lsv] <= nums[pivot] {
                lsv -= 1
            }
            nums.swapAt(pivot, lsv)
        }
        
        //now the pivot is moved into place making `nums` > `n` we need to minimise `nums` so it's as small
        //as can be while still > `n` i.e. if this was a tree we would have reset our search space with a
        //new root and selected the smallest value as the new value for `pivot + 1`
        nums[(pivot + 1)...].reverse()
    }
    
    //Time: O(n)
    //two pointers
    //array
    //
    //See: https://www.youtube.com/watch?v=quAS1iydq7U
    func nextPermutationAlt(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        //find smallest index where the less-significant index is larger than the more-significant index
        var pivot: Int?
        for ls in (1..<nums.count).reversed() {
            let ms = ls - 1
            if nums[ls] > nums[ms] {
                pivot = ms
                break
            }
        }
        
        //if we didn't find our pivot, then there is no larger permutation
        if let pivot = pivot {
            //sort everything to the right of the pivot (least-significant) into ascending order and then swap the
            //pivot for the first (smallest) value that is greater than itself
            let insidePivot = (pivot + 1)
            let sortRange = insidePivot..<nums.count
            let sorted = nums[sortRange].sorted()
            nums.replaceSubrange(sortRange, with: sorted)
            
            for index in insidePivot..<nums.count {
                if nums[index] > nums[pivot] {
                    nums.swapAt(pivot, index)
                    return
                }
            }
        }
        
        nums.sort()
    }
}
