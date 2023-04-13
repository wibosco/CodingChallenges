//
//  DotProductOfTwoSparseVectors.swift
//  LeetCode
//
//  Created by William Boles on 04/03/2022.
//

import Foundation

//https://leetcode.com/problems/dot-product-of-two-sparse-vectors/

//array
//dictionary
//
//Solution Description:
//A sparse vector is a vector where most of its elements are zero. We can take advantage of this by only storing the non-zero values
//and so save on space. Below we build out a dictionary (`nonZeroMap`) to hold those non-zero values in the form of `index: value`.
//This way when we attempt to produce a dot product of two vectors we can iterate through the keys on one vectors and check if the
//other vector has that same key. If it does we multiple them and add them to our ongoing product value else we know that the second
//vector has a zero for that index and we skip it (multipling by zero results in the product being zero). Once we iterate through
//on vectors non-zero indexes we can return the product
struct SparseVector {
    //Space: O(k) where `k` is the number of non-zero elements in `nums`
    let nonZeroMap: [Int: Int] //[index: value]
    
    //Time: O(n) where n is the number of elements in `nums`
    init(_ nums: [Int]) {
        var nonZeroMap = [Int: Int]()
        for (i, num) in nums.enumerated() where num != 0 {
            nonZeroMap[i] = num
        }
        
        self.nonZeroMap = nonZeroMap
    }

    //Time: O(k)
    //Space: O(1)
    func dotProduct(_ vec: SparseVector) -> Int {
        var product = 0
        for (i, v1) in nonZeroMap {
            if let v2 = vec.nonZeroMap[i] {
                product += (v1 * v2)
            }
        }
        
        return product
    }
}

//array
//
//Solution Description:
//Store the `nums` array as a property and in `dotProduct` iterate through both arrays, multiple the values at the same index
//together to get the final product value.
struct SparseVectorStoreWhole {
    //Space: O(n) where n is the number of elements in `nums`
    let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }

    //Time: O(n)
    //Space: O(1)
    func dotProduct(_ vec: SparseVectorStoreWhole) -> Int {
        var product = 0
        for i in 0..<nums.count {
            product += (nums[i] * vec.nums[i])
        }
        
        return product
    }
}
