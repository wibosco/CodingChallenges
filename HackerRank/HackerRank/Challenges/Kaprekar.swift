// Created 12/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/kaprekar-numbers
final class Kaprekar {

     static func kaprekarRange(lowerBounds: Int, upperBounds: Int) -> [Int] {
        var kaprekarRange = [Int]()

        for i in lowerBounds...upperBounds {
            let squaredValue = i * i
            let squaredString = String(squaredValue)

            let leftCharacterCount = squaredString.count / 2

            var leftValue = 0

            if squaredString.count > 1 {
                leftValue = Int(String(squaredString.prefix(leftCharacterCount)))!
            }
            
            let rightValue = Int(String(squaredString.suffix((squaredString.count - leftCharacterCount))))!
            
            if (leftValue + rightValue) == i {
                kaprekarRange.append(i)
            }
        }

        return kaprekarRange
    }
}
