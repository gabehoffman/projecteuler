import Foundation

/* Problem 10 --
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

// Don't run this too high in a playground (around 200K or so), it'll break it
// Use a stand alone command prompt program to get decent performance

var primes: [Int] = []
var sum = 0
for i in 1...2_000{
    if i.isPrime() {
        primes.append(i)
        sum += i
    }
}

print(sum)


// CORRECT ANSWER: 142913828922

