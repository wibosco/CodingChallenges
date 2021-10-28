//
//  TheatreGuestsSingleMove.swift
//  CodingChallenges
//
//  Created by William Boles on 18/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

/**
 Google
 
 You have pairs of guests that show up to the cinema and the booking system isn’t working so each guest gets a seat but that seat isn’t necessary beside their partner. Sort these guests so that they are sitting beside whom they came with?

 You can only move someone once.

 Eg.

 BC AB DA CD ⇒ BB CC AA DD
*/
class TheatreGuestsSingleMove {
    
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
}
