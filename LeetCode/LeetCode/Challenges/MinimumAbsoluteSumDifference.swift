// Created 17/01/2026.

import Foundation

//https://leetcode.com/problems/minimum-absolute-sum-difference/
struct MinimumAbsoluteSumDifference {
    
    //Time: O(n log n) where n is the number of elements in either `nums1` or `nums2`
    //Space: O(n)
    //array
    //sorting
    //binary search
    //
    //Solution Description:
    //Before we can make any changes we first need to calculate the current absolute difference between `nums1` and `nums2`.
    //Once we have that absolute difference we will then know if any changes result in a smaller difference being produced.
    //To find the smallest absolute difference possible we need to find the absolute difference between two elements that
    //can be reduced by most. As we can only make changes to `nums1`, `nums1` is our search space. We compare the elements
    //in `nums1` against each element in `nums2` to see which results in the smaller absolute difference. We want to find
    //the element in `nums1` that is the nearest to the current element in `nums2` as this will result in the smallest
    //possible absolute difference for that element of `nums2`. To speed up searching for that element in `nums1` we can
    //sort `nums1` and then use binary search. The nearest element in `nums1` to the current `nums2` element will either
    //be the element at `left` or `left - 1` so we take the smaller of those two differences. We then use that difference
    //to calculate the absolute difference between the now changed `nums1` and `nums2`. If after the change the new
    //absolute difference is smaller than `minSumDiff`, we replace minSumDiff` with that new difference. We repeat this
    //process until each element in `nums2` has been paired up. We can then `minSumDiff`.
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var orgSumDiff = 0

        var p1 = 0

        while p1 < nums1.count {
            let num1 = nums1[p1]
            let num2 = nums2[p1]

            let absDiff = abs((num1 - num2))
            orgSumDiff += absDiff

            p1 += 1
        }

        var minSumDiff = orgSumDiff
        
        //sort to allow binary search
        let sortedNums1 = nums1.sorted { $0 < $1 }
        
        var p2 = 0
        while p2 < nums2.count {
            let orgNum1 = nums1[p2]
            let num2 = nums2[p2]
        
            var left = 0
            var right = sortedNums1.count - 1
            
            while left < right {
                let mid = left + (right - left) / 2
                
                //find the closest element to `num2` in `nums1`
                if sortedNums1[mid] < num2 {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            
            var tmpDiff = abs(sortedNums1[left] - num2)
            
            //the nearest elements to `num2` in `nums1` can be `left` or `left - 1` so need to check both
            if left > 0 {
                tmpDiff = min(tmpDiff, abs(sortedNums1[left - 1] - num2))
            }
            
            var tmpSumDiff = orgSumDiff
            tmpSumDiff -= abs((orgNum1 - num2))
            tmpSumDiff += tmpDiff
            
            minSumDiff = min(minSumDiff, tmpSumDiff)
            
            p2 += 1
        }

        return minSumDiff % 1_000_000_007 //constrain the difference
    }
    
    //Time: O(n + n ^ 2) where n is the number of elements in `nums1` (or `num2`)
    //Space:
    //array
    //nested loops
    //two pointers
    //modulo
    //
    //Solution Description:
    //Before we can make any changes we first need to calculate the current absolute difference between `nums1` and `nums2`.
    //Once we have that absolute difference we will then know if any changes result in a smaller difference being produced.
    //To find the smallest absolute difference possible we need to find the absolute difference between two elements that
    //can be reduced by most. As we can only make changes to `nums1`, `nums1` is our search space. We compare the elements
    //in `nums1` against each element in `nums2` to see which results in the smaller absolute difference. We want to find
    //the element in `nums1` that is the nearest to the current element in `nums2` as this will result in the smallest
    //possible absolute difference for that element of `nums2`. After each change of `nums1` we recalculate the absolute
    //difference between the now changed `nums1` and `nums2`. If after the change the new absolute difference is smaller
    //than `minSumDiff`, we replace `minSumDiff` with that new difference. We repeat this process until each element in
    //`nums2` has been paired up. We can then `minSumDiff`.
    func minAbsoluteSumDiff2(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var orgSumDiff = 0

        var p1 = 0

        while p1 < nums1.count {
            let num1 = nums1[p1]
            let num2 = nums2[p1]

            let absDiff = abs((num1 - num2))
            orgSumDiff += absDiff

            p1 += 1
        }

        var minSumDiff = orgSumDiff

        var p2 = 0
        while p2 < nums2.count {
            let orgNum1 = nums1[p2]
            let num2 = nums2[p2]

            var p3 = 0

            while p3 < nums1.count {
                let tmpNum1 = nums1[p3]
                
                var tmpSumDiff = orgSumDiff
                tmpSumDiff -= abs((orgNum1 - num2))
                tmpSumDiff += abs((tmpNum1 - num2))

                minSumDiff = min(minSumDiff, tmpSumDiff)

                p3 += 1
            }

            p2 += 1
        }

        return minSumDiff % 1_000_000_007 //constrain difference to maximum allowed
    }
}
