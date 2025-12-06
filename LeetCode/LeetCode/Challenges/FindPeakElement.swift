// Created 16/11/2021.

import Foundation

//https://leetcode.com/problems/find-peak-element/
struct FindPeakElement {
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //
    //IMPORTANT: In the description it states that `nums[i] != nums[i + 1] for all valid i` so it is not possible for the
    //data to contain flats.
    //
    //We can use a twist on binary search to search through `nums` and find the peaks. Rather than comparing the `mid` element
    //against a target, we instead compare it against it's right neighbor and attempt to identify a trend in the data i.e. up,
    //or down (remember there are no flats). Once we know this trend we can move our boundaries accordingly - move left if the
    //right neighbour is lower (we don't just return as while `mid` is greater, it itself might be part of a downward slope),
    //move right if the right neighbour is equal or greater than. Eventually we narrow down on an actual peak and can return
    //it as the `left` index.
    //
    //Similar to: https://leetcode.com/problems/peak-index-in-a-mountain-array/
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
        //Notice here that we don't check `right >= left` this is because we want to check our target `mid` against
        //it's right most neighbor so we need to ensure that a right neighbr exists
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[(mid + 1)] { // only compare with right neighbor to determine slope trean
                //sloping downloads to right of mid
                right = mid
            } else {
                //sloping upwards to right of mid
                left = mid + 1
            }
        }
        
        return left
    }
    
    //Time: O(log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //
    //IMPORTANT: In the description it states that `nums[i] != nums[i + 1] for all valid i` so it is not possible for the
    //data to contain flats.
    //
    //We can use a twist on binary search to search through `nums` and find the peaks. Rather than comparing the `mid` element
    //against a target, we instead compare it against it's neighbors and attempt to identify a trend in the data i.e. up or
    //down (remember there are no flats). Once we know this trend we can move our boundaries accordingly - move left if the
    //right neighbour is lower (we don't just return as while `mid` is greater, it itself might be part of a downward slope),
    //move right if the right neighbour is equal or greater than. Once we find an index where both left and right neighbors
    //are lower we have found a peak and can return that index.
    //
    //Similar to: https://leetcode.com/problems/peak-index-in-a-mountain-array/
    func findPeakElement2(_ nums: [Int]) -> Int {
        return binarySearch(nums)
    }

    private func binarySearch(_ nums: [Int]) -> Int {
        var left = 0
        var right = (nums.count - 1)

        while left <= right {
            let mid = left + (right - left) / 2

            let isPreviousSmaller = mid == 0 ? true : nums[mid] > nums[(mid - 1)]
            let isNextSmaller = mid == (nums.count - 1) ? true : nums[mid] > nums[(mid + 1)]

            if isPreviousSmaller && isNextSmaller {
                //peak
                return mid
            } else if isPreviousSmaller {
                //sloping upwards
                left = mid + 1
            } else {
                //sloping downwards
                right = mid - 1
            }
        }

        return -1
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //
    //Solution Description:
    //Loop through `nums` comparing previous num with current num and current num with next num to find the start of a peak
    func findPeakElement3(_ nums: [Int]) -> Int {
        var nums = nums
        
        nums.append(Int(Int32.min))
        nums.insert(Int(Int32.min), at: 0)
        
        var left = 0
        var mid = 1
        var right = 2
        
        while right < nums.count {
            let leftValue = nums[left]
            let midValue = nums[mid]
            let rightValue = nums[right]
            
            if midValue > leftValue && midValue > rightValue {
                return (mid - 1)
            }
            
            left += 1
            mid += 1
            right += 1
        }
        
        return 0
    }
}
