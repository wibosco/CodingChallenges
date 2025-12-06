// Created 01/09/2024.

import Foundation

//https://leetcode.com/problems/assign-cookies/
struct AssignCookies {
    
    //Time: O(n log n + p log p) where n is the number of elements in `g`
    //                           where p is the number of elements in `s`
    //Space: O(n + p)
    //
    //array
    //sorting
    //two pointers
    //
    //Solution Description:
    //First we sort `g` and `s` in ascending order. Then using two pointers we iterate through the sorted `g` and `s` and attempt to
    //find a value in `s` that is greater than or equal to the current `g`. As both arrays are sorted we ensure that the smallest
    //possible value of `s` matches `g`, this ensures that the maximum number of child are content. we iterate through both `g` and
    //`s` and compare the elements we find at those indexes. If the current value of `s` is greater than or equal to the current
    //value of `g` we increment `content`, `p1` and `p2`; else if the current value of `s` less than the current value of `g` we
    //only increment `p2`. We repeat this process until we either run out of elements in `g` or `s` and can return `content`.
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let sortedGreed = g.sorted()
        let sortedSize = s.sorted()
        
        var p1 = 0
        var p2 = 0
        
        var content = 0
        
        while p1 < sortedGreed.count && p2 < sortedSize.count {
            if sortedGreed[p1] <= sortedSize[p2] {
                content += 1
                
                p1 += 1
            }
            
            p2 += 1
        }
        
        return content
    }
}
