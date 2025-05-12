// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/maximal-range-that-each-element-is-maximum-in-it/
struct MaximalRangeThatEachElementIsMaximumInIt {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n
    //monotonic stack
    //stack
    //array
    //two passes
    //
    //Solution Description:
    //Treating the finding of the left edge of the range and the right edge of the range as two seperate tasks wecan make two
    //passes through `nums` to get the range for each element. Using monotonic decreasing stack holding indexes  we iterate
    //through `nums` and find where the left edge for each element is by popping off stack elements until we reach one that is
    //larger. We then repeat this process to find the right edge being that `i` and `j` are flipped round. Once we have the left
    //and right edge for each element we combine them to determine the range of `nums` where that element is largest. After
    //calculating the range for each element, we return `ranges`.
    func maximumLengthOfRanges(_ nums: [Int]) -> [Int] {
        var stack = [Int]()
        
        //greater element to the left
        var left = Array(repeating: -1, count: nums.count)
        for j in 0..<nums.count {
            while let i = stack.last {
                guard nums[i] > nums[j] else {
                    stack.removeLast()
                    continue
                }
                
                left[j] = i
                break
            }
            stack.append(j)
        }
        
        stack.removeAll()
        
        //greater element to the right
        var right = Array(repeating: nums.count, count: nums.count)
        for j in 0..<nums.count {
            while let i = stack.last {
                guard nums[j] > nums[i] else {
                    break
                }
                
                stack.removeLast()
                
                right[i] = j;
            }
            stack.append(j)
        }
        
        //range
        var ranges = Array(repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            let range = (right[i] - left[i]) - 1
            ranges[i] = range
        }
        
        return ranges
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(n)
    //two pointers
    //array
    //nested loops
    //
    //Solution Description:
    //Using two pointers we determine the left and right range edge of each element by decrementing `left` until we reach
    //either the left edge of `nums` or an element that is larger. We then repeat this process but going right so incrementing
    //`right` until we reach either the right edge of `nums` or an element that is larger. To simplify calculating the range we
    //track the elements in each range in `count`. When the range has been found, it is added to `ranges.` We repeat this
    //process for all elements in `nums` and return `ranges`.
    func maximumLengthOfRanges2(_ nums: [Int]) -> [Int] {
        var ranges = Array(repeating: 1, count: nums.count)
        
        for i in 0..<nums.count {
            var left = i - 1
            var right = i + 1
            var count = 1
            
            while left >= 0 {
                guard nums[left] <= nums[i] else {
                    break
                }
                
                count += 1
                left -= 1
            }
            
            while right < nums.count {
                guard nums[right] <= nums[i] else {
                    break
                }
                
                count += 1
                right += 1
            }
            
            ranges[i] = count
        }

        return ranges
    }
}
