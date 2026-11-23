// Created 02/01/2022.

import Foundation

//https://leetcode.com/problems/continuous-subarray-sum/
struct ContinuousSubarraySum {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(min(n, k))
    //array
    //modulo
    //prefix sum
    //dictionary
    //
    //Solution Description:
    //If `k` or a multiple of `k` exists then it will have a remainder of 0 when divided by `k`. Rather than calculating the
    //sum of every possible subarray, we use a prefix sum to gradually sum the elements in `nums` from 0...i. If we need the
    //sum of j...i we don't need to calculate it directly, instead we can subtract the prefix sum of 0..<j from the prefix
    //sum of 0...i - ensuring that we never backtrack through `nums`. When two prefix sums have the same remainder,
    //subtracting one from the other cancels that remainder out, leaving `k` or a multiple of `k`. So rather than storing
    //each prefix sum we store its remainder in `remainders`, along with the index it was first seen at. If we get a match
    //for `sum % k` in `remainders` then we have found a match from (j + 1)...i - really important to note that it's `j + 1`
    //and not `j`. We only store the first index for each remainder so that any later match produces the longest possible
    //subarray, giving us the best chance of meeting the minimum length of two elements. To handle subarrays that start at
    //index 0, we seed `remainders` with a remainder of 0 at index -1 to represent the empty prefix before `nums` begins -
    //this also keeps `i - j` equal to the length of the subarray.
    //
    //N.B. see https://stackoverflow.com/questions/51830010/continuous-subarray-sum
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var remainders = [Int: Int]()
        remainders[0] = -1 //empty prefix so that subarrays starting at index 0 can be found

        var sum = 0
        var i = 0
        while i < nums.count {
            sum += nums[i]

            let remainder = (sum % k)
            if let j = remainders[remainder] { //found the sum of `k` or a multiple of `k` from (j + 1)...i
                if (i - j) >= 2 { //must be at least two elements
                    return true
                }
            } else { //only interested in the first index with this remainder value
                remainders[remainder] = i
            }

            i += 1
        }

        return false
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //modulo
    //
    //Solution Description:
    //Loop through the `nums` array and add each element to all other elements checking that sum is a multiple of `k`. To ensure
    //all combinations we need to gradually reducing `nums` with each iteration
    func checkSubarraySumBruteForce(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var total = 0
        
        for i in 0..<nums.count {
            total += nums[i]
            for j in (i + 1)..<nums.count {
                total += nums[j]
                
                if total % k == 0 {
                    return true
                }
            }
            
            total = 0
        }
        
        return false
    }
}
