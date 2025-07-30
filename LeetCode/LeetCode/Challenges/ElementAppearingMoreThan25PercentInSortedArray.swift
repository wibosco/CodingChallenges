// Created 30/07/2025.

import Foundation

//https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/
struct ElementAppearingMoreThan25PercentInSortedArray {
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(log n)
    //array
    //sorted
    //binary search
    //binary search find leftmost
    //binary search find rightmost
    //result
    //
    //
    //Solution Description:
    //As `arr` is sorted we know that elements with the same value will be beside each other so we can use binary search to
    //find the left and right most elements for a given value. As we know that one value is at least a quarter of all values
    //we only need to search 3 possible element indexs: `1/4` of `arr`, `2/4` of `arr` and `3/4` of `arr` as one of those
    //elements must have the quarter array value. So taking each value in turn we find the left and right most index of that
    //value and determine if it occupies a quarter of the array. If it does we return that value; if it does not we move
    //onto the next value.
    //
    //Similar to: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
    func findSpecialInteger(_ arr: [Int]) -> Int {
        let threshold = arr.count / 4
        
        //to occupy a quarter of the array, value needs to appear in one of 3 indexes
        let candidates = [(arr.count / 4), (arr.count / 2), ((3 * arr.count) / 4)]
        
        for candidate in candidates {
            let left = leftMost(arr, candidate)
            let right = rightMost(arr, candidate)
            
            if ((right - left) + 1) > threshold {
                return arr[candidate]
            }
        }
        
        return 0
    }
    
    private func leftMost(_ arr: [Int], _ upperBoundary: Int) -> Int {
        let target = arr[upperBoundary]
        
        var left = 0
        var right = upperBoundary
        
        var result = upperBoundary
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if arr[mid] == target {
                //to simplify pointer manipulation we use a result value
                result = mid
                right = mid - 1
            } else if arr[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    private func rightMost(_ arr: [Int], _ lowerBounds: Int) -> Int {
        let target = arr[lowerBounds]
        
        var left = lowerBounds
        var right = arr.count - 1
        
        var result = lowerBounds
        
        while left <= right {
            let mid = left + (right - left) / 2
                
            if arr[mid] == target {
                //to simplify pointer manipulation we use a result value
                result = mid
                left = mid + 1
            } else if arr[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //counting
    //sorted
    //
    //Solution Description:
    //Iterating through `arr` we keep track of the previous value seen and the count how of the previous value we have seen. If
    //the current value of `arr` is the same as the previous value we increment `count` else we set it to 1 as this is a new
    //sequence. We then check if `count` is greater than the `theshold` (which is 25% of `arr` ), if it is we return `val`; if
    //it isn't we continue to iterate. We repeat this process until `count` is greater than `theshold`.
    func findSpecialInteger2(_ arr: [Int]) -> Int {
        let threshold = arr.count / 4

        var count = 0
        var prev = -1

        for val in arr {
            count = prev == val ? count + 1 : 1
            prev = val

            if count > threshold {
                return val
            }
        }

        return 0
    }
}
