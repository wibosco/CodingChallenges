// Created 18/11/2021.

import Foundation

//https://leetcode.com/problems/find-k-closest-elements/
struct FindKClosestElements {
    
    //Time: O(log (n - k) + k) where n is the number of elements in `arr`
    //                         where k is the length of the result
    //Space: O(1)
    //array
    //binary search
    //sorted
    //
    //Solution Description
    //We can use binary search to find the leftmost element closest to `x` then return `k` elements from that index.
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        
        while left < right {
            let mid = left + (right - left) / 2
            
            //N.B. we don't use the absolute value as we want to favour the smaller index here
            if x - arr[mid] > arr[(mid + k)] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return Array(arr[left..<(left + k)])
    }
        
    //Time: O(n + k) where n is the number elements on `arr`
    //Space: O(1)
    //array
    //two pointers
    //sliding window
    //sorted
    //
    //Solution Description:
    //Keeping a window size of `k` we iterate through `arr` and move that window depending on if the current `arr` element is
    //closer to `x`. We can't just gradually slide the window as `arr` contains duplicates so instead we the current `arr`
    //element is closer we take it as the `right` pointer of the window and subtract `k` from `right` to get the `left` pointer
    //of the window. Once all elements have been processed we return the window.
    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = k - 1

        for i in k..<arr.count {
            if abs(arr[i] - x) <= abs(arr[left] - x) {
                left = i - (k - 1)
                right = i
            }
        }

        return Array(arr[left...right]) //O(k)
    }
    
    //Time: O((log n) + k) where n is the number elements on `arr`
    //array
    //two pointers
    //binary search
    //sorted
    //
    //Solution Description:
    //Splitting this into two problems. First we find the smallest closet element of `arr` to `x` using binary search. We know
    //that the closet element will be in the `k` elements to be returned, now we need to find which other elements to include
    //(if any). We compare the neighbors of the closest element against each using two pointers and "select" the closer to `x`
    //by expanding it's pointer. When we have selected `k` elements, we return elements between `left + 1` and `right + 1`.
    func findClosestElements3(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard arr.count > k else {
            return arr
        }
        
        //binary search
        var left = 0
        var right = arr.count - 1
        var closestIndex = 0
    
        while left <= right {
            let mid = left + (right - left) / 2
                
            //update closestIndex if mid is closer to `x` or they are equal distance but mid is a smaller index
            let closestDiff = abs(arr[closestIndex] - x)
            let currentDiff = abs(arr[mid] - x)
            
            if (currentDiff < closestDiff) || ((currentDiff == closestDiff) && mid < closestIndex) {
                closestIndex = mid
            }
            
            if arr[mid] > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        //two pointers
        left = closestIndex - 1
        right = closestIndex + 1
        
        for _ in 0..<(k - 1) {
            if left >= 0 && right < arr.count {
                if abs(arr[left] - x) <= abs(arr[right] - x) {
                    left -= 1
                } else {
                    right += 1
                }
            } else if left <= 0 {
                right += 1
            } else {
                left -= 1
            }
        }
        
        //N.B. the +1 and -1 as these candidate elements should not be included in the returned array
        return Array(arr[(left + 1)...(right - 1)])
    }
}
