//
//  IceCreamParlor.swift
//  CodingChallenges
//
//  Created by William Boles on 11/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/icecream-parlor
class IceCreamParlor {

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
