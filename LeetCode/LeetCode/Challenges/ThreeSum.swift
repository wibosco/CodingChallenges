//
//  3Sum.swift
//  LeetCode
//
//  Created by William Boles on 07/03/2022.
//

import Foundation

//https://leetcode.com/problems/3sum/
//array
struct ThreeSum { //3Sum
    
    //Time: O(n^2) where `n` is the number of elements in `nums`
    //Space: O(n) where `n` is the number of elements in `nums`
    //two pointers
    //sorted
    //nested loop
    //
    //Solution Description:
    //First we sort the `nums` array this will ensure that we have a consistent orderng of values which when combined with
    //the `triplets` set will ensure that if duplicate values exist in `nums` they produce the same triplet and so are
    //omitted from the result. Next we iterate through `nums` and attempt to find two other numbers that when summed are the
    //opposite of the current number (`n1`) - we do this by iterating through the remain `nums` element. As `nums` is sorted
    //we can use two pointers at either end to iterate through the array to find `target`. If the elements at `left` and
    //`right` sum to `target` then we combine those two values together with `n1` into an array and add it to the `triplets`
    //set; if the elements at `left` and `right` sum to greater than `target` then we need to reduce the sum value at `right`
    //by moving inwards by 1 (remember `nums` is sorted so moving the `left` pointer inwards would only increase how over
    //`target` we are so our only option is moving the `right` pointer); if the elements at `left` and `right` sum to less
    //than `target` then we need to increase the sum value which we can do by moving the `left` pointer inwards (remember
    //`nums` is sorted so moving the `right` pointer inwards would only reduce the sum value (which is already too low) so
    //our only option is moving the `left` pointer)
    //
    //Partially built using the same two pointers technique used in https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
    static func threeSum(_ nums: [Int]) -> [[Int]] {
        var triplets = Set<[Int]>() //NB: the int arrays contain values not indexes
        let nums = nums.sorted() //O(n log n)
        
        for (i, n1) in nums.enumerated() {
            guard (i + 1) < nums.count else {
                break
            }
            
            let target = -n1 //as we want to get to 0 we need to find two other numbers that are the opposite of `n1`
            
            var left = (i + 1)
            var right = nums.count - 1
            
            while left < right { //effectively the twosum problem
                let n2 = nums[left]
                let n3 = nums[right]
                
                let sum = n2 + n3
                if sum == target {
                    triplets.insert([n1, n2, n3])
                    left += 1
                    right -= 1
                } else if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return Array(triplets)
    }
    
    //Time: O(n^2) where `n` is the number of elements in `num`
    //Space: O(n) where `n` is the number of elements in `num`
    //dictionary
    //sorted
    //nested loop
    //
    //Solution Description:
    //First we sort the `nums` array this will ensure that we have a consistent orderng of values which when combined with
    //the `triplets` set will ensure that if duplicate values exist in `nums` there produce the same triplet and so are
    //omitted from the result. Next we iterate through `nums` and attempt to find two other numbers that when summed are the
    //opposite of the current number (`n1`) - we do this by iterating through the remain `nums` element. As we iterate through
    //the remaining `nums` we check if another `nums` element can be added to `n2` to equal `target`. To avoid having to
    //another nested loop we build a dictionary containing each seen `nums` element and its `index`. This will allow constant
    //access time to check for if the difference between the current `nums` element and target has already been seen. If that
    //difference is in `map` we combine those two values together with `n1` into an array and add it to the `triplets` set. We
    //then see if there are any more triplets for `n1`. Once we have exhasuted all possible triplets for `n1` (exiting the
    //inner loop), we repeat the process for next element in `nums`. Finally we convert `triplets` into an array and return it.
    //
    //NB: Partially built using the same dictionary technique used in https://leetcode.com/problems/two-sum/
    static func threeSumDictionary(_ nums: [Int]) -> [[Int]] {
        var triplets = Set<[Int]>() //NB: the int arrays are contain values not indexes
        let nums = nums.sorted() //n log n
        
        for (i, n1) in nums.enumerated() {
            guard (i + 1) < nums.count else {
                break
            }
            
            let target = -n1 //as we want to get to 0 we need to find two other numbers that are the opposite of `n1`
            var map = [Int: Int]() //[num: index]
            
            for i in (i + 1)..<nums.count { //effectively the twosum problem
                let n2 = nums[i]
                let n3 = target - n2
                
                if map[n3] != nil {
                    triplets.insert([n1, n3, n2]) //n3 will be an earlier index than n2 so comes first
                }
                
                map[n2] = i
            }
        }
        
        return Array(triplets)
    }
}
