//
//  TheatreGuestsMultipleMoves.swift
//  CodingChallenges
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

/**
 Google
 
 You have pairs of guests that show up to the cinema and the booking system isn’t working so
 each guest gets a seat but that seat isn’t necessary beside their partner. Sort these guests so
 that they are sitting beside whom they came with?

 Eg.

 BC AB DA CD ⇒ BB CC AA DD
*/
class TheatreGuestsMultipleMoves {
     static func sort(guestsInSeats: inout [String]) {
        var index = 1
        while index < guestsInSeats.count {
            if guestsInSeats[index-1] != guestsInSeats[index] {
                let remainingGuests = Array(guestsInSeats[(index+1)..<guestsInSeats.count])
                let partnerIndex = (findGuestsPartnerIndex(guestsInSeats: remainingGuests, partner:guestsInSeats[index-1])) + (index+1)
                
                TheatreGuestsMultipleMoves.swap(data: &guestsInSeats, source:index, destination:partnerIndex)
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
