//
//  FindKClosestElements.swift
//  LeetCode
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-k-closest-elements/
struct FindKClosestElements {
    
    //Time: O(n + k) where n is the number elements on `arr`
    //Space: O(1)
    //array
    //two pointers
    //sliding window
    //
    //Solution Description:
    //Keeping a window size of `k` we iterate through `arr` and move that window depending on if the current `arr` element is
    //closer to `x`. We can't just gradually slide the window as `arr` contains duplicates so instead we the current `arr`
    //element is closer we take it as the `right` pointer of the window and subtract `k` from `right` to get the `left` pointer
    //of the window. Once all elements have been processed we return the window.
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = k - 1

        for i in k..<arr.count {
            guard abs(arr[left] - x) <= abs(arr[i] - x) else {
                left = i - (k - 1)
                right = i

                continue
            }
        }

        return Array(arr[left...right]) //O(k)
    }
    
    //Time: O((log n) + k)
    //divide and conquer
    //two pointers
    //sliding window
    //binary search find exact match
    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard arr.count > k else {
            return arr
        }
        
        var left = 0
        var right = arr.count - 1
        
        //binary search
        while (left + 1) < right {
            let mid = left + (right - left) / 2
            
            if arr[mid] == x {
                left = mid
                break
            } else if arr[mid] > x {
                right = mid
            } else {
                left = mid
            }
        }
        
        let startingIndex = nearestIndex(to: x, in: arr, from: left, to: right)
        
        left = startingIndex
        right = startingIndex
        
        //sliding window
        for i in 0..<(k - 1) {
            let previous = left - 1
            let next = right + 1
            
            if previous < 0 {
                right += ((k - 1) - i)
                break
            } else if next >= arr.count {
                left -= ((k - 1) - i)
                break
            }
            
            let nearestIndex = self.nearestIndex(to: x, in: arr, from: previous, to: next)
            
            if nearestIndex < left {
                left -= 1
            } else {
                right += 1
            }
        }
        
        return Array(arr[left...right])
    }
    
    private func nearestIndex(to x: Int, in arr: [Int], from left: Int, to right: Int) -> Int {
        let leftDelta = abs(arr[left] - x)
        let rightDelta = abs(arr[right] - x)
        
        if rightDelta > leftDelta {
            return left
        } else if leftDelta > rightDelta {
            return right
        } else { //same difference
            if arr[right] > arr[left] {
                return left
            } else {
                return right
            }
        }
    }
}
