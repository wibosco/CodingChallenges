// Created 14/11/2026.

import Foundation

//https://leetcode.com/problems/time-needed-to-buy-tickets/
struct TimeNeededToBuyTickets {
    
    //Time: O(n) where n is the number of elements in `tickets`
    //Space: O(n)
    //array
    //count
    //
    //Solution Description:
    //The queue moves in rounds, in which every person still in the queue buys one ticket and moves to the back. As each
    //purchase takes one unit of time, `time` is the total number of tickets bought by everyone until the person at index
    //`k` buys their last ticket. The person at index `k` needs `tickets[k]` rounds to buy all their tickets. Anyone at or
    //before index `k` is ahead of them in every round, including the last, so can buy in up to `tickets[k]` rounds. Anyone
    //after index `k` is behind them, and the last round ends as soon as the person at index `k` buys their final ticket, so
    //they can only buy in up to `tickets[k] - 1` rounds. A person who needs fewer tickets than that leaves the queue early,
    //so each person contributes the smaller of `tickets[i]` and the number of rounds they can buy in. We iterate through
    //`tickets`, adding each person's contribution to `time`. We then return `time`.
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0

        for i in 0..<tickets.count {
            if i <= k {
                time += min(tickets[i], tickets[k])
            } else {
                time += min(tickets[i], (tickets[k] - 1))
            }
        }

        return time
    }
    
    //Time: O(n * m) where n is the number of elements in `tickets`
    //               where m is the number of tickets the person at index `k` wants to buy
    //Space: O(n)
    //array
    //simulation
    //
    //Solution Description:
    //We simulate the queue. Each pass through `tickets` is one round, in which every person still in the queue buys one
    //ticket and moves to the back. A person with 0 tickets remaining has "left" the queue, so we skip them. For everyone
    //else, we "buy" a ticket by decrementing `tickets[i]`, and as each purchase takes one unit of time, we increment
    //`time`. We keep iterating while the person at index `k` still has tickets to buy. Once they buy their last ticket,
    //we break out of the current round, as no one behind them needs to be processed, and the outer loop ends as
    //`tickets[k] == 0`. We then return `time`.
    func timeRequiredToBuy2(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0

        var tickets = tickets

        while tickets[k] > 0 {
            for i in 0..<tickets.count {
                guard tickets[i] > 0 else {
                    continue
                }

                tickets[i] -= 1
                time += 1

                if i == k, tickets[i] == 0 {
                    break
                }
            }
        }

        return time
    }
}
