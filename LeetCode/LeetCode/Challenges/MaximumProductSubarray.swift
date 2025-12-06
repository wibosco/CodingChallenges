// Created 24/04/2023.

import Foundation

//https://leetcode.com/problems/maximum-product-subarray/
struct MaximumProductSubarray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //As `nums` can contain negative numbers we need to track not just the maximum product but also the minimum product as
    //the product of two negatives is a positive. Iterating through `nums` we calculate the maximum and minimum subarray
    //product up to that element - there are a few things to consider here:
    //
    //1. The maximum/minimum might be just the current value
    //2. The maximum/minimum might be the current maximum/minimum multipled by the current value
    //3. The maximum/minimum might be the opposite maximum/minimum value multipled by the current value (e.g. two negatives)
    //
    //So our comparison needs to take into account all three possibilites. Just to note here that if we take `num` as the
    //maximum or minimum value we are effectively restarting the subarray from that index. Once we update `subarrayMax` to be
    //the new maximum value for the current subarray we compare it agains the alltime maximum value and update it if greater.
    //Once all elements in `nums` have been processed we return `result`.
    func maxProduct(_ nums: [Int]) -> Int {
        var result = nums[0]
        var subarrayMin = nums[0]
        var subarrayMax = nums[0]

        for num in nums[1...] {
            let tmp = subarrayMin //we will be overriding this but need it for the second calculation
            
            //N.B how we use `subarrayMax` and `subarrayMin` in both calculations
            //as a negative number can flip a max to a min or min to a max
            subarrayMin = min(num, (subarrayMax * num), (subarrayMin * num))
            subarrayMax = max(num, (subarrayMax * num), (tmp * num))

            result = max(result, subarrayMax)
        }

        return result
    }
}
