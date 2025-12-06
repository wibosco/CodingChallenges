// Created 29/02/2024.

import Foundation

//https://leetcode.com/problems/fair-candy-swap/
struct FairCandySwap {
    
    //Time: O(n + m) where n is the number of elements in `aliceSizes`
    //               where m is the number of elmets in `bobSizes`
    //Space: O(n)
    //array
    //set
    //maths
    //
    //Solution Description:
    //First we determine the total of `aliceSizes` and `bobSizes` so that we can calculate the difference/delta between the two
    //arrays - this delta will be used to offset how many candies to transfer back to Bob after bob has transfered some to Alice.
    //Then we iterate through `bobSizes` and transfer one over to Alice (we don't actually do anything here), next we calculate
    //how many candies Alice would need to transfer to Bob to even out their totals. To speed up knowing it Alice has an
    //element with that value we have convert `aliceSizes` into a set to allow fo O(1) lookup time. If `aliceSizeLookup` has an
    //element of that value we return both size else we iterate again.
    //
    //N.B. by calculating `candyDifference` without using `abs` we can end up with a negative which means that we dont have to
    //care about who has the larger total when attempting the transfer. As transfering first from the smaller array just means we
    //have to transfer more back while transfering from the smaller array means we have to transfer less back. But both transfers
    //just work without an special handling.
    func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
        var aliceTotal = 0
        var aliceSizeLookup = Set<Int>()
        for size in aliceSizes {
            aliceTotal += size
            aliceSizeLookup.insert(size)
        }
        
        var bobTotal = 0
        for size in bobSizes {
            bobTotal += size
        }
        
        let candyDifference = (aliceTotal - bobTotal) / 2 // `/2` because we need to tranfer half to even them up
        
        for candyToTransferToAlice in bobSizes {
            let candyToTransferToBob = candyDifference + candyToTransferToAlice
            
            if aliceSizeLookup.contains(candyToTransferToBob) {
                return [candyToTransferToBob, candyToTransferToAlice]
            }
        }
        
        return [-1, -1]
    }
}
