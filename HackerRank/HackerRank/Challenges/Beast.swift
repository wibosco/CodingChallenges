// Created 07/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/sherlock-and-the-beast
final class Beast {

    /*
     A Decent Number has the following properties:
     
     Its digits can only be 3's and/or 5's.
     The number of 3's it contains is divisible by 5.
     The number of 5's it contains is divisible by 3.
     If there are more than one such number, we pick the largest one.
     -1 if no valid value
     
     1 = -1
     3 = 555
     5 = 33333
     11 = 55555533333
     */
     static func decentNumber(range: Int) -> String {
        
        if range < 3 {
            
            return "-1"
        }
        
        if range % 3 == 0 {
            
            var decentNumber = ""
            
            for _ in 0..<range {
                
                decentNumber = "\(decentNumber)5"
            }
            
            return decentNumber
        }
        
        for decreasedRange in (0..<range).reversed() {
            
            if decreasedRange % 3 == 0 && (range - decreasedRange) % 5 == 0 {

                let numberOf5s = decreasedRange
                let numberOf3s = (range - decreasedRange)
                
                var decentNumber = ""
                
                for _ in 0..<numberOf5s {
                    
                    decentNumber = "\(decentNumber)5"
                }
                
                for _ in 0..<numberOf3s {
                    
                    decentNumber = "\(decentNumber)3"
                }
                
                return decentNumber
            }
        }

        if range % 5 == 0 {

            var decentNumber = ""

            for _ in 0..<range {

                decentNumber = "\(decentNumber)3"
            }
            
            return decentNumber
        }
    
        return "-1"
    }
}
