//
//  UndergroundSystem.swift
//  LeetCode
//
//  Created by William Boles on 29/03/2022.
//

import Foundation

//https://leetcode.com/problems/design-underground-system/
//design
//
//Time: O(1)
//Space: O(n+m) where n is the number of active journeys and m is the number of station pairs
//
//Solution Description:
//Using two dictionaries we track both the current active journeys and the total time it has taken to travel betweent two
//stations. At the end of each journey we update the record in `times` for that station pair. When finding the average we
//take the total time between a station pair and divide it by the total number of journeys that make up that time.
final class UndergroundSystem {
    private var journeys = [Int: (String, Int)]() //id, sn, t
    private var times = [String: (Int, Int)]() //sn+en, total, number
    
    init() {
        
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        journeys[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let (startStationName, startT) = journeys[id]!
        
        let path = "\(startStationName)-\(stationName)"
        let duration = t - startT
        
        if let (total, num) = times[path] {
            let newTotal = total + duration
            let newNum = num + 1
            
            times[path] = (newTotal, newNum)
        } else {
            times[path] = (duration, 1)
        }
        
        journeys[id] = nil
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let path = "\(startStation)-\(endStation)"
        let (total, num) = times[path]!
        
        return Double(total) / Double(num)
    }
}
