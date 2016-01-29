import Foundation

/* Problem 7- 
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

var primes: [Int] = [2]
var i = 3
repeat {
    if i.isPrime() {
        primes.append(i)
    }
    i += 2
} while primes.count < 10_001

primes.last!
