//
//  BiggerIsGreater.swift
//  CodingChallenges
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/bigger-is-greater
//two pointers
//array

//Both of these solutions are too slow to pass this test
struct BiggerIsGreater {
    static func biggerIsGreater(w: String) -> String {
        var chars = Array(w)

        //find smallest index where the less-significant index
        //is larger than the more-significant index
        var pivot: Int?
        for lsc in (0..<chars.count).reversed() {
            guard lsc != 0 else {
                break
            }
            let msc = lsc - 1
            if chars[lsc] > chars[msc] {
                pivot = msc
                break
            }
        }

        //if we didn't find our pivot, then there is no bigger
        //permutation
        if let pivot = pivot {
            //sort everything to the right of the pivot (least-
            //significant) into ascending order and then swap
            //the pivot for the first (smallest) vslue that is
            //greater than itself
            let insidePivot = (pivot + 1)
            let sortRange = insidePivot..<chars.count
            let sorted = chars[sortRange].sorted()
            chars.replaceSubrange(sortRange, with: sorted)
            
            for index in insidePivot..<chars.count {
                if chars[index] > chars[pivot] {
                    chars.swapAt(pivot, index)
                    break
                }
            }

            return String(chars)
        }

        return "no answer"
    }
    
    static func biggerIsGreaterAlt(w: String) -> String {
        var pivot: (String.Index, Character)?
        for lsc in w.indices.reversed() {
            guard lsc != w.startIndex else {
                break
            }

            let msc = w.index(lsc, offsetBy: -1)

            if w[lsc] > w[msc] {
                pivot = (msc, w[msc])
                break
            }
        }

        if let pivot = pivot {
            var min: (String.Index, Character)?
            let insidePivotIndex = w.index(pivot.0, offsetBy: 1)
            for index in w[insidePivotIndex..<w.endIndex].indices.reversed() {
                if w[index] > pivot.1 {
                    if let tmpMin = min {
                        if w[index] < tmpMin.1 {
                            min = (index, w[index])
                        }
                    } else {
                        min = (index, w[index])
                    }
                }
            }

            var adjustable = w
            adjustable.replaceSubrange(min!.0...min!.0, with: String(pivot.1))
            adjustable.replaceSubrange(pivot.0...pivot.0, with: String(min!.1))

            let sortRange = insidePivotIndex..<adjustable.endIndex
            let sorted = adjustable[sortRange].sorted()
            adjustable.replaceSubrange(sortRange, with: sorted)

            return adjustable
        }

        return "no answer"
    }
}
