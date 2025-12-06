// Created 05/06/2024.

import Foundation

//https://leetcode.com/problems/flipping-an-image/
struct FlippingAnImage {
    
    //Time: O(n * m) where n is the number of rows in `image`
    //               where m is the number of columns in `image`
    //Space: O(1)
    //array
    //matrix
    //two pointers
    //
    //Solution Description:
    //Going row-by-row and using two pointers `p1` and `p2`, where `p1` is the left-most element and `p2` the right-most in that row,
    //we work out to in and invert each value we come across before then swapping them. To ensure that we invert all values we need
    //to allow `p1`and `p2` to be equal which means that we perform an unnecessary swap but avoid having to invert outside of the
    //loop. We repeat this process for an rows in `image`.
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var flippedAndInvertedImage = image
        
        for row in 0..<image.count {
            flipAndInvert(row, &flippedAndInvertedImage)
        }
        
        return flippedAndInvertedImage
    }
    
    private func flipAndInvert(_ row: Int, _ image: inout [[Int]]) {
        var p1 = 0
        var p2 = image[row].count - 1
        
        while p1 <= p2 { // `<=` to be able to invert all values
            let p1Value = invert(image[row][p1])
            let p2Value = invert(image[row][p2])
            
            image[row][p1] = p2Value
            image[row][p2] = p1Value
            
            p1 += 1
            p2 -= 1
        }
    }
    
    private func invert(_ value: Int) -> Int {
        return value == 0 ? 1 : 0
    }
}
