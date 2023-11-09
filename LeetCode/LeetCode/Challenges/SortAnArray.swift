//
//  SortAnArray.swift
//  LeetCode
//
//  Created by William Boles on 18/05/2022.
//

import Foundation

//https://leetcode.com/problems/sort-an-array/
struct SortAnArray {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //heap sort
    //max heap
    //
    //Solution Description:
    //Using min-heap we are able sort `nums` using heap sort. First we fill the heap with the contents of `nums` and then
    //gradually the top element from the heap - each removal causes the heap to re-arrange itself and ensure that the next
    //smallest value in that heap is now at the top. As we empty to heap we fill the `sorted` array.
    static func sortArray(_ nums: [Int]) -> [Int] {
        var heap = Heap(elements: nums) { $0 < $1 }
        var sorted = [Int]()
        
        while !heap.isEmpty {
            guard let element = heap.remove() else {
                break
            }
            
            sorted.append(element)
        }
        
        return sorted
    }
    
    //Time: O(n * k) where n is the number of elements in `nums`
    //               where k is the number of digits of the largest number
    //Space: O(n) two buckets
    //array
    //sorting
    //radix sort (LSD)
    //
    //Solution Description:
    //Using radix sort we start with the least significant digit (LSD - left) in each element of `nums` and place that element
    //into a bucket using that digit as the "key". We then reconstruct `nums` by extracting the elements from the buckets in
    //ascending order of bucket keys. As we extract elements from each bucket it is essential that we maintain the order of the
    //elements in that bucket as this ordering (along with the bucket ordering) is gradually sorting `nums`. We repeat the
    //bucket sorting with the new ordering of `nums` and the next digit of each element in `nums` (if some elements don't have
    //a next digit 0 is assumed) until there as no more digits to be sorted.
    //
    //N.B. As `nums` can contain negative values we need two sets of buckets. We extract from the negative buckets (in reverse
    //order) first and then extract from the positive buckets.
    //
    //N.B. Radix sort is not a comparison sort
    //
    //N.B. Similar to counting sort in that buckets are used
    static func sortArrayRadixSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        let base = 10 //we need the base to allow us to move between different digits in each `nums` element
        var sorted = false
        var digitColumn = 1
        
        while !sorted {
            sorted = true
            
            var negativeBuckets = Array(repeating: [Int](), count: base) //ignore `0` in this array
            var positiveBuckets = Array(repeating: [Int](), count: base)
            
            for num in nums {
                let shiftedNum = num / digitColumn //move the digit we are interested in to the unit column
                let digit = shiftedNum % base //extract the unit column value as a single digit
                
                if digit >= 0 {
                    positiveBuckets[digit].append(num)
                } else {
                    negativeBuckets[abs(digit)].append(num)
                }
                
                if shiftedNum != 0 {
                    sorted = false
                }
            }
            
            digitColumn *= base //move onto the next digit column e.gg unit -> tens or hundreds -> thousands
            
            //reconstruct `nums` with the "slightly more sorted" elements
            nums = negativeBuckets.reversed().flatMap { $0 } //9 is actually -9 so we need to reverse ordering
            nums += positiveBuckets.flatMap { $0 }
        }
        
        return nums
    }
    
    //Time: O(n + k) where n is the number of elements in `nums`
    //               where k is the unique elements in `nums`
    //Space: O(k)
    //array
    //sorting
    //counting sort
    //dictionary
    //
    //Solution Description:
    //Using counting sort we iterate through all elements in `nums` and store how often they appear in the dictionary `countMap`
    //i.e. the element is keys and the frequency is the value. We also keep track of the lowest and highest element that we
    //seen to allow for performant retrieve of those frequency values. After counting all frequencies we then iterate from `low`
    //to `high` and check if that value has an entry in the dictionary. If it does have an entry then we add the value of the
    //current iteration `i` to the `sorted` array `count` times; if it doesn't we skip it. As we are going from low to high we
    //will be adding those values in non-descending order.
    static func sortArrayCountingSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var low = Int.max //allow for easier retrieval of values in `countMap` without further sorting
        var high = Int.min
        
        var countMap = [Int: Int]() //element: frequency
        
        for num in nums {
            countMap[num, default: 0] += 1
            
            if num < low {
                low = num
            }
            
            if num > high {
                high = num
            }
        }
        
        var sorted = [Int]()
        for i in low...high { //non-descending order
            if let count = countMap[i] {
                sorted.append(contentsOf: Array(repeating: i, count: count))
            }
        }
        
        return sorted
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(log n) recursive stack
    //array
    //sorting
    //quicksort
    //divide and conquer
    //recursive
    //
    //Solution Description:
    //Using quicksort we recursively sort `nums` around a "pivot". The pivot is and element of `nums` that we move into its
    //sorted index by ensuring that all elements before the pivot index are less than or equal to (in value) the pivot and all
    //elements after the pivot index are greater than the pivot. We recursively sort those two subarrays
    //(`left..<(pivotIndex - 1)` and `(pivotIndex + 1)..right` - ensuring to exclude the pivots index as it is already sorted)
    //until the left edge to be sorted is greater than or equal the right edge - this recursive branch has been sorted.
    //
    //N.B. if `nums` was sorted, time drops to O(n^2), space drops to O(n)
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    static func sortArrayQuicksort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        quickSort(&nums, 0, (nums.count - 1)) //note the "-1" for right
        
        return nums
    }
    
    private static func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        guard left < right else {
            return
        }
        
        let sortedIndex = partition(&nums, left, right)
        
        //as the `sortedIndex` is now in its final location we need to sort the remainder of `nums`
        quickSort(&nums, left, (sortedIndex - 1)) //partition/sort those elements to the left of the pivot
        quickSort(&nums, (sortedIndex + 1), right) //partition/sort those elements to the right of the pivot
    }
    
    private static func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
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
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n) merged array
    //array
    //sorting
    //merge sort
    //divide and conquer
    //recursive
    //
    //Solution Description:
    //Using merge sort we split sorting into two stages - we recursively break `nums` down into single element arrays then we
    //merge the two single element arrays together so that we have one non-descending array. As we are merging two sorted
    //arrays (a array of size 1 is sorted) we iterate through both arrays and take the smallest of the two elements to add next
    //to our merged array. We repeat this merging process as we return through the recursive call stack so that we end up with:
    //
    //                [4, 7, 2, 6, 1, 2]
    //
    //            [4, 7, 2]        [6, 1, 2]
    //
    //         [4] [7, 2]            [6] [1, 2]
    //
    //       [7] [2]                      [1] [2] <---- no `4` or `6` as they can't be split into smaller arrays
    //
    // ----------------- Merging begins -------------------
    //
    //         [4] [2, 7]            [6] [1, 2]  <---- `1` and `2` are merged first because their branch was one deeper than `6`
    //
    //            [2, 4, 7]        [1, 2, 6]
    //
    //                [1, 2, 2, 4, 6, 7]
    //
    static func sortArrayMergeSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        return mergeSort(nums, 0, nums.count) //note that we the count without - 1
    }
    
    private static func mergeSort(_ nums: [Int], _ left: Int, _ right: Int) -> [Int] {
        guard right - left > 1 else { //single element
            return [nums[left]]
        }
        
        let mid = left + (right - left) / 2
        
        let left = mergeSort(nums, left, mid)
        let right = mergeSort(nums, mid, right)
        
        return merge(left, right)
    }
    
    private static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merged = [Int]()
        
        var p1 = 0
        var p2 = 0
        
        //merge left and right together in non-descending order
        while p1 < left.count && p2 < right.count {
            if left[p1] < right[p2] {
                //left[p1] is smaller
                merged.append(left[p1])
                p1 += 1
            } else if left[p1] > right[p2] {
                //right[p2] is smaller
                merged.append(right[p2])
                p2 += 1
            } else {
                //equal so add both
                merged.append(left[p1])
                p1 += 1
                merged.append(right[p2])
                p2 += 1
            }
        }
        
        //merge the remainder of either array into `merged`
        if p1 < left.count {
            merged.append(contentsOf: left[p1...])
        } else if p2 < right.count {
            merged.append(contentsOf: right[p2...])
        }
        
        return merged
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //insertion sort
    //
    //Solution Description:
    //Using insertion sort, We split `nums` into two sections: sorted and unsorted. As we iterate through `nums` we move each
    //element we encounter from the unsorted section to its position within the sorted section (based on the current elements
    //already in the sorted section). To discover that sorted position we gradually compare that unsorted element with each
    //sorted element (in descending order) until the unsorted element larger than the sorted element and we insert that
    //unsorted element into its sorted position. This process is repeated until all elements are sorted.
    static func sortArrayInsertionSort(_ nums: [Int]) -> [Int] {
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
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //selection sort
    //
    //Solution Description:
    //Using selection sort, we find the smallest element in `nums` and replace the current element at 0 with that smallest
    //element. Next find the second smallest element in `nums` and replace the current element at 1 with that second smallest
    //element. This process is repeated until all elements are sorted.
    static func sortArraySelectionSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        for sortingIndex in 0..<nums.count {
            var smallestIndex = sortingIndex
            
            for currentIndex in (sortingIndex + 1)..<nums.count {
                if nums[currentIndex] < nums[smallestIndex] { //ascending order
                    smallestIndex = currentIndex
                }
            }
            
            nums.swapAt(sortingIndex, smallestIndex)
        }
        
        return nums
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //bubble sort
    //
    //Solution Description:
    //Using bubble sort we compare adjacent elements in `nums` and swap them if they are out of order. As we are only swapping
    //adjacent elements in order to get each element into its sorted position we may need to make multiple passes. In order to
    //know when `nums` is sorted, at the start of each pass through we set `sorted` to true. If `sorted` remains true after
    //passing through each element in `nums` then we know that `nums` is sorted and can stop looping; if `sorted` is false then
    //we know that at some point the previous loop we swapped elements and need to check again.
    static func sortArrayBubbleSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var sorted = false
        var nums = nums
        
        while !sorted {
            sorted = true
            
            for i in 1..<nums.count {
                if nums[(i - 1)] > nums[i] {
                    nums.swapAt((i - 1), i)
                    sorted = false
                }
            }
        }
        
        return nums
    }
}
