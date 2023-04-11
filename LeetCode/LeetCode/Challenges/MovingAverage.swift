//
//  MovingAverage.swift
//  LeetCode
//
//  Created by William Boles on 28/02/2022.
//

import Foundation

//https://leetcode.com/problems/moving-average-from-data-stream/
//design
//
//Time: O(n) `n` is the window size
//Space: O(1)
final class MovingAverage {
    private let size: Int
    private var values = [Int]()
    private var sum = 0
    
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        values.append(val)
        
        let sub = values.count > size ? values.removeFirst() : 0
        sum = sum - sub + val
        let divider = min(values.count, size)
        
        return (Double(sum) / Double(divider))
    }
}
