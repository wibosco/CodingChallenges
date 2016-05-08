//
//  CutTheSticks.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/cut-the-sticks
class CutTheSticks: NSObject {

    class func cutUntilDone(sticks: [Int]) -> [Int] {
        
        var sticksRemainingAtEachCut = [Int]()
        
        var sticksToBeCut = sticks
        
        while (sticksToBeCut.filter{$0 > 0}.count) > 0 {
            
            sticksRemainingAtEachCut.append(sticksToBeCut.filter{$0 > 0}.count)
            
            let minStickLength = sticksToBeCut.filter{$0 > 0}.minElement()!
            
            for index in 0..<sticksToBeCut.count {
                
                let stick = sticksToBeCut[index]
                
                let newStickLength = stick - minStickLength
                
                sticksToBeCut[index] = newStickLength
            }
        }
        
        return sticksRemainingAtEachCut
    }
}
