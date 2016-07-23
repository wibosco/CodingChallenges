//
//  TheatreGuests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 18/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//Google
//Can only move each guest once
class TheatreGuests: NSObject {

    // MARK: MaximumOneMoveEach
    
    class func sortGuestsInSeatsAlt(inout guestsInSeats: [String]) {
        var guests = [String: [Int]]()
        for (index, guest) in guestsInSeats.enumerate() {
            var partners = guests[guest]
            if partners == nil {
                partners = [Int]()
            }
            partners!.append(index)
            guests[guest] = partners
        }
        
        var jumpsSinceLastMove = 0
        var index = 0
        
        while jumpsSinceLastMove < ((guestsInSeats.count/2)-1) {
            let guestToBePartneredUp = guestsInSeats[index]
            var guestToBeMovedIndex: Int
            
            if index % 2 == 0 {
                guestToBeMovedIndex = index+1
            } else {
                guestToBeMovedIndex = index-1
            }

            let guestToBeMoved = guestsInSeats[guestToBeMovedIndex]
        
            if guestToBePartneredUp != guestToBeMoved {
                let partnerIndexes = guests[guestToBePartneredUp]!
                var guestToBePartneredUpPartnersIndex = 0
                
                for partnerIndex in partnerIndexes {
                    if partnerIndex != index {
                        guestToBePartneredUpPartnersIndex = partnerIndex
                    }
                }
                
                guestsInSeats[guestToBeMovedIndex] = guestsInSeats[guestToBePartneredUpPartnersIndex]
                guestsInSeats[guestToBePartneredUpPartnersIndex] = guestToBeMoved
                
                var guestToBeMovedIndexes = guests[guestToBeMoved]!
                
                for (index, guestIndex) in guestToBeMovedIndexes.enumerate() {
                    if guestIndex == guestToBeMovedIndex {
                        guestToBeMovedIndexes[index] = guestToBePartneredUpPartnersIndex
                        guests[guestToBeMoved] = guestToBeMovedIndexes
                        break
                    }
                }
            
                jumpsSinceLastMove = 0
                index = guestToBePartneredUpPartnersIndex
            } else {
                jumpsSinceLastMove += 1
                index += 2
            }
        }
    }
    
    // MARK: MultipleMoves
    
    class func sortGuestsInSeats(inout guestsInSeats: [String]) {
        var index = 1
        while index < guestsInSeats.count {
            if guestsInSeats[index-1] != guestsInSeats[index] {
                let remainingGuests = Array(guestsInSeats[(index+1)..<guestsInSeats.count])
                let partnerIndex = (findGuestsPartnerIndex(remainingGuests, partner:guestsInSeats[index-1])) + (index+1)
                
                TheatreGuests.swap(&guestsInSeats, source:index, destination:partnerIndex)
            }
            
            index += 2
        }
    }
    
    class func findGuestsPartnerIndex(guestsInSeats: [String], partner: String) -> Int {
        for (index, guest) in guestsInSeats.enumerate() {
            if guest == partner {
                return index
            }
        }
        
        return -1
    }
    
    class func swap(inout data: [String], source: Int, destination: Int) {
        let temp = data[destination]
        data[destination] = data[source]
        data[source] = temp
    }
}
