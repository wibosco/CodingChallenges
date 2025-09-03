// Created 03/09/2025.

import Foundation

struct QuickSelect {
    
    // MARK: - Smallest
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //quickselect
    //inline
    //inout
    //two pointers
    //
    //Solution Description:
    //Using quickselect we recursively sort `nums` around a "pivot". The pivot is an element of `nums` that we move into its
    //sorted index by ensuring that all elements before the pivot index are less than or equal to (in value) the pivot and all
    //elements after the pivot index are greater than the pivot. Each element that we sort that isn't in the `k` index results
    //in us having to choose which subarray to further sort - `left..<(pivotIndex - 1)` or `(pivotIndex + 1)..right`. If `k`
    //is smaller than the recently sorted `pivot` we continue sorting `left..<(pivotIndex - 1)` and abandon those to the
    //right or if `pivot` is larger we continue sorting `(pivotIndex + 1)..right`. Note how with either branch we exclude the
    //`pivot` index as this has already been sorted. Once the `kth` element has been sorted into it's final position we return
    //that value.
    //
    //N.B. if `nums` was sorted, time drops to O(n^2), space drops to O(n)
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    func findKthSmallest(_ nums: [Int], _ k: Int) -> Int {
        let k = k - 1
        var nums = nums
        
        return smallestQuickSelect(&nums, k, 0, (nums.count - 1))
    }
    
    private func smallestQuickSelect(_ nums: inout [Int], _ k: Int, _ left: Int, _ right: Int) -> Int {
        let partitionIndex = smallestPartition(&nums, left, right)
        
        if partitionIndex == k {
            return nums[k]
        } else if partitionIndex > k {
            return smallestQuickSelect(&nums, k, left, (partitionIndex - 1))
        } else {
            return smallestQuickSelect(&nums, k, (partitionIndex + 1), right)
        }
    }
    
    private func smallestPartition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right] //note this is the value not the index
        
        var i = left //i becomes the edge of the values less than the pivot and those greater than the pivot
        
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            
            //moving the elements that are less than the pivot to the left of where the pivot will eventually end up
            if nums[j] <= pivot { //non-descending order
                nums.swapAt(i, j)
                i += 1
            }
        }
        
        //moving the pivot into its final location with all elements less than or equal to it to the left and all elements
        //greater than it to the right
        nums.swapAt(i, right) //note make sure to use the index of the pivot here and not the pivot itself
        
        return i
    }
    
    // MARK - Largest
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //quickselect
    //inline
    //inout
    //two pointers
    //
    //Solution Description:
    //Using quickselect we recursively sort `nums` around a "pivot". The pivot is an element of `nums` that we move into its
    //sorted index by ensuring that all elements before the pivot index are less than or equal to (in value) the pivot and all
    //elements after the pivot index are greater than the pivot. Each element that we sort that isn't in the `k` index results
    //in us having to choose which subarray to further sort - `left..<(pivotIndex - 1)` or `(pivotIndex + 1)..right`. If `k`
    //is smaller than the recently sorted `pivot` we continue sorting `left..<(pivotIndex - 1)` and abandon those to the
    //right or if `pivot` is larger we continue sorting `(pivotIndex + 1)..right`. Note how with either branch we exclude the
    //`pivot` index as this has already been sorted. Once the `kth` element has been sorted into it's final position we return
    //that value.
    //
    //N.B. if `nums` was sorted, time drops to O(n^2), space drops to O(n)
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let k = k - 1
        var nums = nums
        
        return largestQuickSelect(&nums, k, 0, (nums.count - 1))
    }
    
    private func largestQuickSelect(_ nums: inout [Int], _ k: Int, _ left: Int, _ right: Int) -> Int {
        let partitionIndex = largestPartition(&nums, left, right)
        
        if partitionIndex == k {
            return nums[k]
        } else if partitionIndex > k {
            return largestQuickSelect(&nums, k, left, (partitionIndex - 1))
        } else {
            return largestQuickSelect(&nums, k, (partitionIndex + 1), right)
        }
    }
    
    private func largestPartition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right] //note this is the value not the index
        
        var i = left //i becomes the edge of the values less than the pivot and those greater than the pivot
        
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            
            //moving the elements that are less than the pivot to the left of where the pivot will eventually end up
            if nums[j] >= pivot { //non-ascending order
                nums.swapAt(i, j)
                i += 1
            }
        }
        
        //moving the pivot into its final location with all elements less than or equal to it to the left and all elements
        //greater than it to the right
        nums.swapAt(i, right) //note make sure to use the index of the pivot here and not the pivot itself
        
        return i
    }
}
