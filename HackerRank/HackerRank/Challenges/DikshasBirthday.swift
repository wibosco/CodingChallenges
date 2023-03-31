//
//  DikshasBirthday.swift
//  CodingChallenges
//
//  Created by William Boles on 11/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/taum-and-bday
final class DikshasBirthday {

     static func costOfGifts(numberOfBlackGifts: Int, numberOfWhiteGifts: Int, costOfBlackGift: Int, costOfWhiteGift: Int, costOfConvertingAGift: Int) -> Int {
        var costOfGifts = 0
        
        if costOfBlackGift == costOfWhiteGift {
            costOfGifts = (numberOfBlackGifts * costOfBlackGift) + (numberOfWhiteGifts * costOfWhiteGift)
        } else {
            var costOfWhiteGifts = 0
            var costOfBlackGifts = 0
            
            if (numberOfWhiteGifts * costOfWhiteGift) > (numberOfWhiteGifts * (costOfBlackGift + costOfConvertingAGift)) {
                costOfWhiteGifts = (numberOfWhiteGifts * (costOfBlackGift + costOfConvertingAGift))
            } else {
                costOfWhiteGifts = (numberOfWhiteGifts * costOfWhiteGift)
            }
            
            if (numberOfBlackGifts * costOfBlackGift) > (numberOfBlackGifts * (costOfWhiteGift + costOfConvertingAGift)) {
                costOfBlackGifts = (numberOfBlackGifts * (costOfWhiteGift + costOfConvertingAGift))
            } else {
                costOfBlackGifts = (numberOfBlackGifts * costOfBlackGift)
            }
            
            costOfGifts = costOfWhiteGifts + costOfBlackGifts
        }
        
        return costOfGifts
    }
}
