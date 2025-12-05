// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/find-subsequence-of-length-k-with-the-largest-sum/
struct FindSubsequenceOfLengthKWithTheLargestSum {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //
    //Solution Description:
    //If we want to find the maximum subsequence then we want to take the `k` largest elements in `nums` and add them together.
    //The difficulty is in perserving the order of those `k` largest elements. So we first iterate through `nums` and pair the
    //original index and value up into a new array `indexedNums`. We then sort `indexedNums` by value in descending order to get
    //the largest elements, We take the `k` largest elements and then sort those `k` elements back into their original order.
    //Then we iterate through those sorted `k` elements and add each value to `result`, which is the returned.
    func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
        var indexedNums = [(Int, Int)]() //[(index, value)]

        for (i, num)in nums.enumerated() {
            indexedNums.append((i, num))
        }

        indexedNums.sort { $0.1 > $1.1 }
        indexedNums = Array(indexedNums.prefix(k))
        indexedNums.sort { $0.0 < $1.0 }

        var result = [Int]()
        for (_, num) in indexedNums {
            result.append(num)
        }

        return result
    }
}
