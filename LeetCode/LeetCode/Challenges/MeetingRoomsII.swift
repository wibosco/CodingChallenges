//
//  MeetingRoomsII.swift
//  LeetCode
//
//  Created by William Boles on 27/03/2022.
//

import Foundation

//https://leetcode.com/problems/meeting-rooms-ii/
//array
struct MeetingRoomsII {
    
    //Time: O(n log n) where n is the number of elements in intervals
    //Space: O(n) two arrays for the start and end times
    //sorted
    //two pointers
    //
    //Solution Description:
    //What's important to understand is that a room is only free once the "current time" is greater than or equal to
    //that meetings end time. The current time is defined by the position we are at in the `intervals` array. As
    //meeting can start and end within the duration of an earlier meeting we can't simply sort the `intervals` array
    //and compare neighbors. Instead we need to split out the start (`startTimes`) and end times (`endTimes`) into
    //seperate, sorted arrays and then iterate through `startTimes` and compare it against `endTimes` to determine
    //how many rooms are in use at any given time - `roomsInUse`. To do we keep two pointers `startPointer` and
    //`endPointer` which we can increment at different rates. If the current meeting start time is less than the
    //current end time then we need another room (increment `roomsInUse`); if the start time is greater than or equal
    //to the current time we can free a room (decrement `roomsInUse`) and check the next end time to see if we can
    //free any more rooms until the end time go beyond the current time. Once we have iterated through all start
    //times we return the max rooms in use at one time.
    static func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else {
            return 1
        }
        
        var startTimes = [Int]()
        var endTimes = [Int]()
        
        for interval in intervals {
            startTimes.append(interval[0])
            endTimes.append(interval[1])
        }
        
        startTimes.sort { $0 < $1 }
        endTimes.sort { $0 < $1 }
        
        var startPointer = 0
        var endPointer = 0
        
        var roomsInUse = 0
        var roomsNeeded = 0
        
        while startPointer < startTimes.count {
            while startTimes[startPointer] >= endTimes[endPointer] {
                roomsInUse -= 1
                endPointer += 1
            }
            
            roomsInUse += 1
            startPointer += 1
            
            roomsNeeded = max(roomsNeeded, roomsInUse)
        }
        
       return roomsNeeded
    }
}
