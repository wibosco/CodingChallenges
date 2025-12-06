// Created 13/11/2021.

import Foundation

//https://leetcode.com/problems/search-in-rotated-sorted-array/
struct SearchInRotatedSortedArray {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //array
    //
    //Solution Description:
    //First we need to find the pivot index. To do this we can perform an altered binary search that rather than attempting to
    //find a target is attempting to find where the current index is greater than the next index e.g. [4, 5, 6, 0, 1, 2 ,3] -
    //here the pivot is index 3 as index 2 is greater. Once we find the pivot i.e. the original start of the sorted array, we
    //need to determine if the target is before or after that pivot (provided the pivot isn't actually the target) e.g. in
    //[4, 5, 6, 0, 1, 2 ,3] is the target in [4, 5, 6] or [1, 2, 3] - effectively performing a one step binary search. Once we
    //have our sorted subarray we can then perform a standard binary search to find the target
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        //find pivot i.e smallest element
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                //pivot is to the right of mid
                left = mid + 1
            } else {
                //pivot is to the left of mid
                right = mid - 1
            }
        }
        
        let pivot = left
        
        guard nums[pivot] != target else {
            return pivot
        }
        
        left = 0
        right = nums.count - 1
        
        //determine which subarray the target might be in and only search that subarray
        if target >= nums[pivot] && target <= nums[right] {
            left = pivot
        } else {
            right = pivot
        }
        
        //find target
        while left <= right {
            let mid = left + (right - left) / 2
            
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //array
    //
    //Solution Description:
    //In a sorted array, index 0 contains a smaller value than index n. We can use this property to know where to search in this
    //array using binary search by treating it as effectively two sorted arrays - 0..<pivot and pivot..n. First we determine our
    //mid point and compare it against the target - if mid is the target then we return that index else we compare mid with our
    //right most index (remember if this is the second or later iterations right wouldn't be nums.count - 1). If mid is greater
    //than right then we know that pivot is in right part of the subarray i.e. right part isn't sorted, so we compare the target
    //against the sorted left array and adjust boundaries appropriately - reducing the search space by half; if mid is less then
    //we do the opposite. Eventually we either find the target in the array or after we have exhausted the search space we return
    //-1.
    func searchOneLoop(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
    
        while left <= right {
            let mid = left + (right - left) / 2
            
            if target == nums[mid] {
                return mid
            } else if nums[mid] > nums[right] {
                //we know that left...mid is sorted so search there i.e. pivot is somewhere to the right of mid
                if target >= nums[left] && target <= nums[mid] {
                    //search left
                    right = mid - 1
                } else {
                    //search right
                    left = mid + 1
                }
            } else {
                //we know that mid...right is sorted so search there i.e. pivot is somewhere to the left of mid
                if target >= nums[mid] && target <= nums[right] {
                    //search right
                    left = mid + 1
                } else {
                    //search left
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}
