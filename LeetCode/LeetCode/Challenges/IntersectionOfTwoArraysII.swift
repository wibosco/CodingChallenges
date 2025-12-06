// Created 20/11/2021.

import Foundation

//https://leetcode.com/problems/intersection-of-two-arrays-ii/
struct IntersectionOfTwoArraysII {
    
    //Time: O(n log n + m log m + min(n, m)) where n is the number of values in `nums1`, m is the number of values in `nums2`
    //Space: O(n) (intersection)
    //two pointers
    //sorting
    //
    //Solution Description:
    //First we sort `nums1` and `nums2`, this allows us to use two pointer to iterate through both arrays. When the elements
    //that `p1` and `p2` are pointing match then we add that value to `intersectingValues`; if they don't match and the value
    //of `p1` is greater `p2` then we increment `p2` to increase its value; if `p2` is greater we increment `p1`. We continue
    //this either `p1` or `p2` reaches the end of its array
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted() //O(n log n)
        let nums2 = nums2.sorted() //O(m log m)
        
        var intersection = [Int]()
        
        var p1 = 0
        var p2 = 0
        
        while p1 < nums1.count && p2 < nums2.count {
            if nums1[p1] == nums2[p2] {
                intersection.append(nums1[p1])
                
                p1 += 1
                p2 += 1
            } else if nums1[p1] > nums2[p2] {
                p2 += 1
            } else {
                p1 += 1
            }
        }
        
        return intersection
    }
    
    //Time: O(n + m) where n is the number of values in `nums1`, m is the number of values in `nums2`
    //Space: O(n + m)
    //dictionary
    //
    //Solution Description
    //We first build up a dictionary `frequency` to hold the count of all the elements in `nums1`. We then iterate through
    //`nums2` and where we find a match for the current `nums2` element in `frequency` we add that element to `intersection`
    // - if that frequency for the match is still above 0. We then decrement that frequency by 1 so we don't end up over
    //counting matches.
    func intersectDictionary(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var frequency = [Int: Int]()
        
        for num in nums1 {
            frequency[num, default: 0] += 1
        }
        
        var intersection = [Int]()
        
        for num in nums2 {
            if let count = frequency[num], count > 0 {
                intersection.append(num)
                frequency[num] = count - 1
            }
        }
        
        return intersection
    }
    
    //Time: O(m log m + n log m) where n is the number of values in `nums1`, m is the number of values in `nums2`
    //Space: O(n) (intersection)
    //binary search find exact match
    //sorting
    //
    //Solution Description:
    //By sorting `nums2` we can use binary search to find matching elements between `nums1` and `nums2`.
    func intersectBinarySearch(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = [Int]()
        
        var nums2 = nums2.sorted() //O(m log m)
        
        for num1 in nums1 {
            let index = binarySearch(nums2, for: num1)
            if index != -1 {
                intersection.append(num1)
                nums2.remove(at: index)//Time: O(n) operation
            }
        }
        
        return intersection
    }
    
    private func binarySearch(_ nums: [Int], for target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
}
