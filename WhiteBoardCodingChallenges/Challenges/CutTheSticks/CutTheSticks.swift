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
        
        var greaterThenZeroValues = true
        
        while greaterThenZeroValues {
            
            sticksRemainingAtEachCut.append(sticksToBeCut.filter{$0 > 0}.count)
            
            greaterThenZeroValues = false
            
            let minStickLength = sticksToBeCut.filter{$0 > 0}.minElement()!
            
            for index in 0..<sticksToBeCut.count {
                
                let stick = sticksToBeCut[index]
                
                let newStickLength = stick - minStickLength
                
                sticksToBeCut[index] = newStickLength
                
                if newStickLength > 0 {
                    
                    greaterThenZeroValues = true
                }
            }
        }
        
        return sticksRemainingAtEachCut
    }
}
