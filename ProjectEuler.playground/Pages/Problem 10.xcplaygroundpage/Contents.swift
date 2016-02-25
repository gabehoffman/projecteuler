import Foundation

/* Problem 10 --
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

// Don't run the brute force method too high in a playground (around 200K or so), it'll break it
// Use a stand alone command prompt program to get decent performance

var maxSearch = 2_000

var primes: [Int] = []
var sum = 0
for i in 1...maxSearch{
    if i.isPrime() {
        primes.append(i)
        sum += i
    }
}
print(sum)


// Upgrade to using the Sieve of Eratosthenes
// Won't break things :)
maxSearch = 2_000_000
sum = 0
primes = maxSearch.sieve()
for i in primes.indices {
    sum += primes[i]
}

print(sum)

// CORRECT ANSWER: 142913828922

