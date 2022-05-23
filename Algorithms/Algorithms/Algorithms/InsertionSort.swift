//
//  InsertionSort.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

struct InsertionSort {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //sorting
    //insertion sort
    //
    //Solution Description:
    //Using insertion sort, We split `nums` into two sections: sorted and unsorted. As we iterate through `nums` we move each
    //element we encounter from the unsorted section to its position within the sorted section (based on the current elements
    //already in the sorted section). To discover that sorted position we gradually compare that unsorted element with each
    //sorted element (in descending order) until the unsorted element larger than the sorted element and we insert that
    //unsorted element into its sorted position. This process is repeated until all elements are sorted.
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        for unsortedIndex in 1..<nums.count {
            for sortedIndex in (1...unsortedIndex).reversed() {
                //move nums[unsortedIndex] into position by moving it left one element at a time
                //nums[unsortedIndex] becomes nums[sortedIndex] as it moves through the sorted elements
                if nums[(sortedIndex - 1)] > nums[sortedIndex] {
                    nums.swapAt((sortedIndex - 1), sortedIndex)
                } else {
                    //nums[unsortedIndex] has been sorted into position
                    break
                }
            }
        }
        
        return nums
    }
}
