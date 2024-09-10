//
//  SwapAdjacentInLRString.swift
//  LeetCode
//
//  Created by William Boles on 10/09/2024.
//

import Foundation

//https://leetcode.com/problems/candy-crush/
struct SwapAdjacentInLRString {
    
    //Time: O(n) where n is the number of elements in either `start` or `end`
    //Space: O(n)
    //array
    //two pointers
    //fast forwarding
    //
    //Solution Description:
    //Rather than attempting to transform `start` into `end` we only need to know that the transformation is possible. We have 
    //two operations than can be performed - `L` can move backwards throught `X` elements and `R` can move forwards through `X`
    //elements. Using two pointers we can iterate through both `start` and `end` and look for the "moveable elements" - `L` and
    //`R`. When we encounter either an `L` or `R` element we check that relative position is correct with regards to the other
    //array i.e. `p1` and `p2` are pointing at the same element even if their indexes are different. Then we check if the
    //element in `start` can be transformed to be at the same index as the element in `end` - with `L` elements this is to
    //check that `p1` is ahead of `p2` so that the `start` elemen can be moved backwards; with `R` elements this is to check
    //that `p1` is behind `p2` so that the `start` element can be moved forwards. If having virtually adjusted all moveable
    //elements in `start` and `end` we can return true - if we find that `start` or `end` have a different number of moveable
    //elements we return false.
    func canTransform(_ start: String, _ end: String) -> Bool {
        //can swap `XL` with `LX` and can swap `RX` with `XR
        let start = Array(start)
        let end = Array(end)
        
        var p1 = 0
        var p2 = 0
        
        while p1 < start.count || p2 < end.count {
            //`L` and `R` are moveable elements, `L` can move backwards and `R` forwards
            while p1 < start.count, start[p1] == "X" { //fast forward to find "moveable" element
                p1 += 1
            }
            
            while p2 < end.count, end[p2] == "X" { //fast forward to find "moveable" element
                p2 += 1
            }
            
            //if one pointer has reached the end of it's array but the other hasn't then they can't match
            guard (p1 < start.count) == (p2 < end.count) else {
                return false
            }
            
            //if both `p1` and `p2` at beyond their array counts when both only found `X` elements when fast forwarding
            guard p1 < start.count && p2 < end.count else {
                return true
            }
            
            //beed to be the same movable element
            guard start[p1] == end[p2] else {
                
                return false
            }
            
            //if `start[p1]` is an "L" check if `p1` can be moved "backwards" to match `p2`
            //if `start[p3]` is an "R check if `p1` can be moved forwards to match `p2`
            guard (start[p1] == "L" && p1 >= p2) || (start[p1] == "R" && p2 >= p1) else {
                return false
            }
            
            p1 += 1
            p2 += 1
        }
        
        return true
    }
}
