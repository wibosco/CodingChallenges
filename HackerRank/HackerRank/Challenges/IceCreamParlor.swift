// Created 11/07/2016.

import Foundation

//https://www.hackerrank.com/challenges/icecream-parlor
final class IceCreamParlor {

     static func chosenIceCreams(money: Int, iceCreamChoices: [Int]) -> (firstIceCream: Int?, secondIceCream: Int?) {
        for i in 0..<(iceCreamChoices.count-1) {
            for j in (i+1)..<iceCreamChoices.count {
                if (iceCreamChoices[i] + iceCreamChoices[j]) == money {
                    return (i, j)
                }
            }
        }
        
        return (nil, nil)
    }
}
