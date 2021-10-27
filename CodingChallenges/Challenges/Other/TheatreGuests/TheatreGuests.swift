//
//  TheatreGuests.swift
//  CodingChallenges
//
//  Created by William Boles on 18/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//Google
//Can only move each guest once
class TheatreGuests {
    
    // MARK: MaximumOneMoveEach
    
     static func sortGuestsInSeatsAlt(guestsInSeats: inout [String]) {
        var guests = [String: [Int]]()
        for (index, guest) in guestsInSeats.enumerated() {
            var partners = guests[guest]
            if partners == nil {
                partners = [Int]()
            }
            partners!.append(index)
            guests[guest] = partners
        }
        
        var partners = 0
        var index = 0
        
        while partners < ((guestsInSeats.count/2)-1) {
            print("index: \(index), seating: \(guestsInSeats.joined(separator: " "))")
            
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
                
                for (index, guestIndex) in guestToBeMovedIndexes.enumerated() {
                    if guestIndex == guestToBeMovedIndex {
                        guestToBeMovedIndexes[index] = guestToBePartneredUpPartnersIndex
                        guests[guestToBeMoved] = guestToBeMovedIndexes
                        break
                    }
                }
                
                partners += 1
                index = guestToBePartneredUpPartnersIndex
            } else {
                partners += 1
                index += 2
            }
        }
    }
    
    // MARK: MultipleMoves
    
     static func sortGuestsInSeats(guestsInSeats: inout [String]) {
        var index = 1
        while index < guestsInSeats.count {
            if guestsInSeats[index-1] != guestsInSeats[index] {
                let remainingGuests = Array(guestsInSeats[(index+1)..<guestsInSeats.count])
                let partnerIndex = (findGuestsPartnerIndex(guestsInSeats: remainingGuests, partner:guestsInSeats[index-1])) + (index+1)
                
                TheatreGuests.swap(data: &guestsInSeats, source:index, destination:partnerIndex)
            }
            
            index += 2
        }
    }
    
     static func findGuestsPartnerIndex(guestsInSeats: [String], partner: String) -> Int {
        for (index, guest) in guestsInSeats.enumerated() {
            if guest == partner {
                return index
            }
        }
        
        return -1
    }
    
     static func swap(data: inout [String], source: Int, destination: Int) {
        let temp = data[destination]
        data[destination] = data[source]
        data[source] = temp
    }
}
