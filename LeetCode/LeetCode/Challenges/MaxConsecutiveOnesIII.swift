// Created 30/05/2025.

import Foundation

//https://leetcode.com/problems/max-consecutive-ones-iii/
struct MaxConsecutiveOnesIII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //two pointers
    //sliding window
    //array
    //fast forward
    //
    //Solution Description:
    //Using two pointers we iterate through `nums` in a sliding window. As we iterate through `nums` if `nums[right]` has a value
    //of 0`, then we increment `flips` and check if `flips` is now greater than `k` - if it is we move `left` rightwards until
    //we enounter a `0` where we then decrement `flips` and the while loop exits. We then calculate the difference between the
    //two pointers and compare that against the current `maxCount`, if it is greater then the difference becomes the new
    //`maxCount`. We repeat this process until `right` reaches the end of `nums` at which point we return `maxCount`.
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var maxCount = 0
        
        var left = 0
        var right = 0

        var flips = 0

        while right < nums.count {
            if nums[right] == 0 {
                flips += 1
            }
            
            while flips > k {
                if nums[left] == 0 {
                    flips -= 1
                }
                
                left += 1
            }

            let count = (right - left) + 1
            maxCount = max(maxCount, count)

            right += 1
        }

        return maxCount
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //two pointers
    //sliding window
    //array
    //fast forward
    //
    //Solution Description:
    //Using two pointers we iterate through `nums` in a sliding window. As we iterate through `nums` if `nums[right]` has a value
    //of 0`, then we either flip that value to `1` if we still have flips remaining or move `left` to the right of its next `0`
    //value index - this might be to the right of `right` if `flips` started as `0`. We then calculate the difference between the
    //two pointers and compare that against the current `maxCount`, if it is greater then the difference becomes the new
    //`maxCount`. We repeat this process until `right` reaches the end of `nums` at which point we return `maxCount`.
    func longestOnes2(_ nums: [Int], _ k: Int) -> Int {
        var maxCount = 0
        
        var left = 0
        var right = 0

        var flips = k

        while right < nums.count {
            if nums[right] == 0 {
                if flips > 0 {
                    flips -= 1
                } else {
                    while nums[left] == 1 {
                        left += 1
                    }
                    
                    //could end up in front of right
                    left += 1
                }
            }

            let count = (right - left) + 1
            maxCount = max(maxCount, count)

            right += 1
        }

        return maxCount
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //
    //Solution Description:
    //We iterate through `nums` until we encounter an index with the value of `0`. We then decide if this value can be flipped
    //or not. If it can be flipped we add the index of `flipped` and move on; if it can't be flipped because we have "used"
    //all our flips we remove the oldest flipped index to be replaced with the newest flipped index so ensuring the correct
    //number of flips have occurred. In each iteration we calculate the current length of consecutive `1` values and if
    //greater than `maxCount` we replace `maxCount` with that value. Once all elements in `nums` have been processed we return
    //`maxCount`.
    func longestOnes3(_ nums: [Int], _ k: Int) -> Int {
        var flipped = [Int]()
        var maxCount = 0
        
        var count = 0
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                if k > 0 {
                    if flipped.count == k {
                        let removedIndex = flipped.removeFirst()
                        count = (i - removedIndex)
                    } else {
                        count += 1
                    }

                    flipped.append(i)
                } else {
                    count = 0
                }
            } else {
                count += 1
            }

            maxCount = max(maxCount, count)

            i += 1
        }

        return maxCount
    }
}
