//
//  ThreeSumClosest.swift
//  LeetCode
//
//  Created by William Boles on 07/03/2022.
//

import Foundation

//https://leetcode.com/problems/3sum-closest/
struct ThreeSumClosest {
    
    //Time: O(n log n + n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //two pointers
    //nested loops
    //
    //Solution Description:
    //We sort the `nums` array into ascending order, this will allow us to iterate through the array and make choices to get
    //nearer to `target` without having to produce all possible triplets combinations of `nums`. Ee select the first  value
    //(num) of our triplet and then using two pointers we iterate through the possible choices for the other two values
    //(`left` and `right`). As our target may not be possible to sum to with the values in `nums` we can't use the same
    //technique as used in other `*Sum` problems by finding the two values that are the difference between `num` and `target`
    //instead we need to fully iterate through `nums` until the pointers cross and check each combination of triplets for
    //the absolute difference between the triplet sum and `target`. We check track of the closet sum to allow this comparison
    //to be made. If the current triplet difference is nearer we set `closetSum` to be the sum of the current triplet; If not
    //we adjust the pointers and move onto the next combination. If the triplet is sum is greater than `target` then we need
    //to reduce the sum value by moving the `right` pointer inwards by 1 (remember `numbers` is sorted so moving the `left`
    //pointer inwards would only increase how over `target` we are so our only option is moving the `right` pointer); if
    //triplet sum is less than or equal to `target` then we need to increase the sum value which we can do by moving the
    //`left` pointer inwards (remember `numbers` is sorted so moving the `right` pointer inwards would only reduce the sum
    //value (which is already too low) so our only option is moving the `left` pointer). We repeat this process for all
    //possible starting values.
    //
    //Similar to: https://leetcode.com/problems/3sum/
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted(by: <)
        var closestSum = Int(Int32.max)

        for (i, num) in nums.enumerated() {
            var left = i + 1 //don't want to reuse `i`
            var right = nums.count - 1

            while left < right {
                let sum = num + nums[left] + nums[right]

                if abs(target - sum) < abs(target - closestSum) { //NB: absolute difference
                    closestSum = sum
                }

                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return closestSum
    }
    
    //Time: O(n log n + n^2) where n is the number of nodes in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //nested loops
    //
    //Solution Description:
    //We sort the `nums` array into ascending order, this will allow us to iterate through the array and make choices to get
    //nearer to `target` without having to produce all possible triplets combinations of `nums`. First we select the first
    //value (n1) of our triplet and then using two pointers we iterate through the possible choices for the other two values
    //(n2 and n3). As our target may not be possible to sum to with the values in `nums` we can't use the same technique as
    //used in other `*Sum` problems by finding the two values that are the difference between `n1` and `target` instead we
    //need to fully iterate through `nums` until the pointers cross and check each combination of triplets for the absolute
    //difference between the triplet sum and `target`. We check track of the closet absolute difference to allow this
    //comparison to be possible. If the current triplet difference is nearer we set both `closetDifference` and `closetSum`
    //to be the difference and sum respectively of the current triplet; If not we adjust the pointers and move onto the next
    //combination. If the triplet is sum is greater than `target` then we need to reduce the sum value by moving the `right`
    //pointer inwards by 1 (remember `numbers` is sorted so moving the `left` pointer inwards would only increase how over
    //`target` we are so our only option is moving the `right` pointer); if triplet is sum is less than `target` then we need
    //to increase the sum value which we can do by moving the `left` pointer inwards (remember `numbers` is sorted so moving
    //the `right` pointer inwards would only reduce the sum value (which is already too low) so our only option is moving the
    //`left` pointer). We repeat this process for all possible starting values.
    //
    //Similar to: https://leetcode.com/problems/3sum/
    func threeSumClosest2(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        //careful: while we use the smallest absolute difference between target and sum to determine
        //which triplet to return, we actually want to return the SUM of the triplets not the difference
        var closetDifference = Int.max
        var closetSum = 0
        
        for i in 0..<(nums.count - 2) { //the final two elements will be used by the inner loop
            let n1 = nums[i]
            
            var left = (i + 1) //don't want to reuse `i`
            var right = nums.count - 1
            
            while left < right {
                let n2 = nums[left]
                let n3 = nums[right]
                
                let currentSum = (n1 + n2 + n3)
                let currentDifference = abs(target - currentSum) //NB: absolute difference
                
                if closetDifference > currentDifference {
                    closetDifference = currentDifference
                    closetSum = currentSum
                }
                
                if currentSum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return closetSum
    }
}
