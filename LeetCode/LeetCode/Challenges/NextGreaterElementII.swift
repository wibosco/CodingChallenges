// Created 01/06/2025.

import Foundation

//https://leetcode.com/problems/next-greater-element-ii/
struct NextGreaterElementII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //stack
    //monotonic stack
    //array
    //multi-pass
    //
    //Solution Description:
    //Using a decreasing monotonic stack we make two reverse order passes through `nums`. Due the circular nature of `nums` an
    //elements next greater value can be to the right or left of that element so the first pass finds any the greater element
    //that exists to the right and the second pass any greater element that exists to the left. Using a decreasing monotonic
    //stack ensures that the first value found on the stack we the smallest next value that is greater than the current value.
    //We use a `result` array to store the values of the next greater element and return it after the second pass is complete.
    //
    //Similar to: https://leetcode.com/problems/next-greater-node-in-linked-list/
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack = [Int]() //indexes where the values make a decreasing monotonic stack
        var result = Array(repeating: -1, count: nums.count)

        for _ in 0..<2 { //two passes
            for i in (0..<nums.count).reversed() {
                while let last = stack.last, nums[last] <= nums[i] {
                    stack.removeLast()
                }

                if let last = stack.last {
                    result[i] = nums[last]
                }

                stack.append(i)
            }
        }

        return result
    }
}
