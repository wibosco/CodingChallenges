// Created 11/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/taum-and-bday
final class DikshasBirthday {

     static func costOfGifts(_ numberOfBlackGifts: Int, _ numberOfWhiteGifts: Int, _ costOfBlackGift: Int, _ costOfWhiteGift: Int, _ costOfConvertingAGift: Int) -> Int {
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
