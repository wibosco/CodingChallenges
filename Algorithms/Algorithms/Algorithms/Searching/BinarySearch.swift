//
//  BinarySearch.swift
//  Algorithms
//
//  Created by William Boles on 25/05/2022.
//

import Foundation

struct BinarySearch {
    
    //Time: O(log n) where n is the number of elements in `values`
    //Space: O(1)
    //binary search
    //array
    //sorted
    //divide and conquer
    //two pointers
    //
    //Solution Description:
    //Binary search works by selecting the middle index in the sorted array `values` and comparing its value against `target`.
    //If `values[mid]` matches `target` then we have found our target and can return; if  `values[mid]` does not match `target`
    //then we half the search space by moving either `left` to the right (if `values[mid]` was smaller than `target`) or moving
    //`right` to the left (if `values[mid]` was larger than `target`). We can reduce the search space like this because `values`
    //is sorted so we know that if `values[mid]` was smaller than `target` then any index less than `mid` will contain an even
    //smaller value than `values[mid]` so searching those other indexes would be pointless (the opposite is true for reducing
    //the search space to the right of `mid`).
    //
    //N.B. The binary search uses `left <= right` as we are trying to find any version of `target` in `values` so if we do find
    //`target` we exit the search immediately. If we get to the point where left > right then we know that `target` does not
    //exist in `values`
    static func findIndex(of target: Int, in values: [Int]) -> Int? {
        guard values.count > 1 else {
            return values.first == target ? 0 : nil
        }
        
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] == target {
                return mid
            } else if values[mid] > target {
                //values[mid] is too large lets ensure a smaller value is chosen next time by selecting from the smaller side
                //of the possible values
                right = mid - 1
            } else {
                //values[mid] is too small lets ensure a larger value is chosen next time by selecting from the larger side
                //of the possible values
                left = mid + 1
            }
        }
        
        return nil
    }
    
    //Time: O(log n) where n is the number of elements in `values`
    //Space: O(1)
    //binary search
    //array
    //sorted
    //divide and conquer
    //two pointers
    //
    //Solution Description:
    //Finding the last index of `target` is a special (but common) twist on the standard binary search. Binary search works by
    //selecting the middle index in the sorted array `values` and comparing that middle index value against `target`. As we are
    //trying to find the last instance of `target` if `values[mid]` matches `target` then we treat finding `target` in the same
    //manner as `values[mid]` being smaller than `target` - we reduce the search space by moving the left boundary (`left`) to
    //the right. If `values[mid]` is greater than `target` then we reduce the search space by moving the right boundary
    //(`right`) to the left. We continue to search until eventually left is greater than right. If `values` contains `target`
    //then the last index of `target` will be at `values[right]` so we compare that index against `target` and if they match we
    //return that `right`; if they don't match we return nil
    //
    //N.B. The binary search uses `left <= right` so that `right` is moved onto the last instance of `target` in `values` by
    //causing `left` to move off of the `target` and triggering `right = mid - 1` on the final loop e.g.
    //
    // values = [1, 2, 2, 2, 3, 4, 5, 6]
    // target = 2
    // left = 0, right = 7
    //
    // 1st iteration:
    // before search: left = 0, right = 7
    // during search: mid = 3
    //  after search: left = 4, right = 7
    //
    // 2nd iteration:
    // before search: left = 4, right = 7
    // during search: mid = 5
    //  after search: left = 4, right = 4
    //
    // 3rd iteration:
    // before search: left = 4, right = 4
    // during search: mid = 4
    //  after search: left = 4, right = 3
    //
    // 4th iteration:
    // exits
    //
    static func findLastIndex(of target: Int, in values: [Int]) -> Int? {
        guard values.count > 1 else {
            return values.first == target ? 0 : nil
        }
        
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] <= target {
                //values[mid] is either too small or matches the target.
                //To makes sure that we either find target or find the last instance of target we need to ensure ensure a later
                //index is chosen next time so move the left boundary of the search space right
                left = mid + 1
   
            } else {
                //values[mid] is too large to ensure a smaller value is chosen next time we need to move the right boundary of
                //the search space left
                right = mid - 1
            }
        }
        
        //only right can be used here
        return values[right] == target ? right : nil
    }
    
    //Time: O(log n) where n is the number of elements in `values`
    //Space: O(1)
    //binary search
    //array
    //sorted
    //divide and conquer
    //two pointers
    //
    //Solution Description:
    //Finding the first index of `target` is a special (but common) twist on the standard binary search. Binary search works by
    //selecting the middle index in the sorted array `values` and comparing that middle index value against `target`. As we are
    //trying to find the first instance of `target` if `values[mid]` matches `target` then we treat finding `target` in the same
    //manner as `values[mid]` being larger than `target` - we reduce the search space by moving the right boundary (`right`) to
    //the left. Important to note that in this version of binary search this reduced search space still contains `mid` as it is
    //possible that `mid` is the first instance of `target`. If `values[mid]` is less than `target` then we reduce the search
    //space by moving the left boundary (`left`) to the right. We continue to search until eventually left is greater than or
    //equal to to right. If `values` contains `target` then the first index of `target` will be at `values[left]` so we compare
    //that index against `target` and if they match we return that `left`; if they don't match we return nil.
    //
    //N.B. The binary search uses `left < right` so that `left` is moved onto the first instance of `target` in `values` e.g.
    //
    // values = [1, 2, 2, 2, 3, 4, 5, 6]
    // target = 2
    // left = 0, right = 7
    //
    // 1st iteration:
    // before search: left = 0, right = 7
    // during search: mid = 3
    //  after search: left = 0, right = 3
    //
    // 2nd iteration:
    // before search: left = 0, right = 3
    // during search: mid = 1
    //  after search: left = 0, right = 1
    //
    // 3rd iteration:
    // before search: left = 0, right = 1
    // during search: mid = 0
    //  after search: left = 1, right = 1
    //
    // 4th iteration:
    // exits
    //
    static func findFirstIndex(of target: Int, in values: [Int]) -> Int? {
        guard values.count > 1 else {
            return values.first == target ? 0 : nil
        }
        
        var left = 0
        var right = values.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= target {
                //values[mid] is either too large so lets ensure a smaller value is chosen next time by selecting from the
                //smaller side of the possible values or values[mid] is equal to target but we don't know if it is the first
                //instance of target so we need to keep searching
                right = mid
            } else {
                //values[mid] is too small lets ensure a larger value is chosen next time by selecting from the larger side
                //of the possible values
                left = mid + 1
            }
        }
        
        //left and right are equal here so could choose either
        return values[left] == target ? left : nil
    }
}
