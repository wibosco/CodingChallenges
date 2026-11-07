// Created 07/11/2026.

import Foundation

//https://leetcode.com/problems/median-of-two-sorted-arrays/
struct MedianOfTwoSortedArrays {
    
    //Time: O(n + m) where n is the number of elements in `nums1`
    //               where m is the number of elements in `nums2`
    //Space: O(n + m)
    //array
    //two pointers
    //modulo
    //
    //Solution Description:
    //Using two pointers we iterate through `nums1` and `nums2` and merge them into one array - `merged`. We take the smallest
    //element from either for a given set of indexes and append it to the end of `merged`, we then increment which pointer was
    //used to take that element. Once either `p1` or `p2` has exceeded to count of their array we append the remaiing elements
    //on to `merged`. We then determine if the merged array is even or odd. If even we need to take the two elements either side
    //of the actual middle value, sum them and divide by 2 to get the median; if odd we can take the middle element and divide
    //by 2 t get the median.
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var merged = [Int]()

        var p1 = 0
        var p2 = 0

        while p1 < nums1.count, p2 < nums2.count {
            if nums1[p1] <= nums2[p2] {
                merged.append(nums1[p1])
                p1 += 1
            } else {
                merged.append(nums2[p2])
                p2 += 1
            }
        }

        while p1 < nums1.count {
            merged.append(nums1[p1])
            p1 += 1
        }

        while p2 < nums2.count {
            merged.append(nums2[p2])
            p2 += 1
        }

        let mid = merged.count / 2

        if merged.count % 2 == 0 {
            //even count
            let left = Double(merged[(mid - 1)])
            let right = Double(merged[mid])

            return (left + right) / Double(2)
        } else {
            //odd count
            return Double(merged[mid])
        }
    }
}
