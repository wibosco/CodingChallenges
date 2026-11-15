// Created 15/11/2026.

import Foundation

//https://leetcode.com/problems/count-days-spent-together/
struct CountDaysSpentTogether {
    
    //Time: O(1)
    //Space: O(1)
    //string
    //array
    //prefix sum
    //
    //Solution Description:
    //Rather than work with months and days, we convert each date into the day of the year it represents. To make that
    //conversion O(1) we use a prefix sum holding the number of days before the start of each month (the year is not a leap
    //year, so these values are fixed) and add the day of the month to it. Alice and Bob can only overlap once both have
    //arrived and before either has left, so the overlap runs from the latest (max) arrival to the earliest (min) departure.
    //Subtracting `arrival` from `departure` and adding 1 (as both dates are inclusive) gives the number of shared days. If
    //there is no overlap this value will be zero or negative, so we clamp it to a minimum of 0.
    func countDaysTogether(_ arriveAlice: String, _ leaveAlice: String, _ arriveBob: String, _ leaveBob: String) -> Int {
        let prefixSum = [0,31,59,90,120,151,181,212,243,273,304,334]

        let aa = inDays(arriveAlice, prefixSum)
        let al = inDays(leaveAlice, prefixSum)

        let ba = inDays(arriveBob, prefixSum)
        let bl = inDays(leaveBob, prefixSum)

        let arrival = max(aa, ba)
        let departure = min(al, bl)

        return max(0, (departure - arrival) + 1)
    }

    private func inDays(_ date: String, _ prefixSum: [Int]) -> Int {
        let date = Array(date)

        let month = Int(String(date[0...1]))! - 1
        let days = Int(String(date[3...4]))!

        return prefixSum[month] + days
    }
}
