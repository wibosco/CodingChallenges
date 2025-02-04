//
//  MeetingRooms.swift
//  LeetCode
//
//  Created by William Boles on 28/03/2022.
//

import Foundation

//https://leetcode.com/problems/meeting-rooms/
struct MeetingRooms {
    
    //Time: O(n log n) where n is the number of elements in `intervals`
    //Space: O(n)
    //array
    //sorting
    //intervals
    //
    //Solution Description:
    //First we sort `intervals` by ascending start time and then iterate through that sorted array comparing the start
    //time and end time of neighbors to determine if any two meeting overlap. If they do overlap we immediately return
    //false; if there are no overlaps we return true
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard intervals.count > 1 else {
            return true
        }
        
        var intervals = intervals
        
        intervals.sort { $0[0] < $1[0] }
        
        for i in 1..<intervals.count {
            if intervals[(i - 1)][1] > intervals[i][0] {
                return false
            }
        }
        
        return true
    }
}
