//
//  KClosestPointsToOrigin.swift
//  CodingChallenges
//
//  Created by William Boles on 13/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/k-closest-points-to-origin/
//array
struct KClosestPointsToOrigin {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //quickselect
    //inplace
    //
    //Solution Description:
    //Using `quick select` we sort `points` around a pivot by gradually partitioning `nums` into a smallers semi-sorted arrays.
    //We do not need to fully sort `points`, instead we only need to sort up to the `kth` index so after each partitioning we
    //check if the elements up to the `kth` index as been sorted if so we can return `points[0..<k]` else we take one half of
    //the semi-sorted array and partition it further.
    //
    //N.B. Here we are using Lomutos partitioning scheme, see https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    static func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        quickSelect(&points, 0, (points.count - 1), k) //note the "-1" for right
        
        let closetPoints = Array(points[0..<k])
        
        return closetPoints
    }
    
    private static func quickSelect(_ points: inout [[Int]], _ left: Int, _ right: Int, _ k: Int) {
        guard left < right else {
            return
        }
        
        let partitionIndex = partition(&points, left, right)
        
        if partitionIndex == k {
            return
        } else if k < partitionIndex {
            quickSelect(&points, left, (partitionIndex - 1), k)
        } else {
            quickSelect(&points, (partitionIndex + 1), right, k)
        }
    }
    
    private static func partition(_ points: inout [[Int]], _ left: Int, _ right: Int) -> Int {
        let pivot = squaredDistance(points[right]) //note that the pivot is set using the right pointer
        
        var i = left // `i` will track the start of the section that is > pivot
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            if squaredDistance(points[j]) <= pivot {
                points.swapAt(i, j)
                i += 1
            }
        }
        
        points.swapAt(i, right) //put the pivot in place
        
        return i
    }
    
    private static func squaredDistance(_ point: [Int]) -> Int {
        let xValue = pow(Double(point[0]), Double(2))
        let yValue = pow(Double(point[1]), Double(2))
        
        return Int((xValue + yValue)) // no need for sqaure root
    }
}
