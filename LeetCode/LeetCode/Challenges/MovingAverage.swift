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
//Time: O(n) where n is the window size
//Space: O(1)
final class MovingAverage {
    private let size: Int
    private var store = [Int]()
    private var total = 0

    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        store.append(val)
        total += val

        if store.count > size {
            total -= store.removeFirst()
        }

        return Double(total)/Double(store.count)
    }
}
