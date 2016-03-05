import Foundation

/* Problem 14 

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

*/

13.collatzChainLength()

var longestChainLength = 1
var longestCollatzSeed = 0

for var i = 999_999; i > 100_000; i-- {
    let length = i.collatzChainLength()
    if length > longestChainLength {
        longestChainLength = length
        longestCollatzSeed = i
    }
    
}

print(longestCollatzSeed)

// Correct Answer = 837799