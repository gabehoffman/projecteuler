import Foundation

/* Problem 10 --
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

// Don't run the brute force method too high in a playground (around 200K or so), it'll break it
// Use a stand alone command prompt program to get decent performance

var maxSearch = 2_000

public func problem10Classic() -> Int {
    var primes: [Int] = []
    var sum = 0
    for i in 1...maxSearch{
        if i.isPrime() {
            primes.append(i)
            sum += i
        }
    }
    return(sum)
}

public func problem10Sieve() -> Int {
// Upgrade to using the Sieve of Eratosthenes
// Won't break things :) even at 2 million
    //var maxSearch = 2_000_000
    let primes = maxSearch.sieve()
    let sum = primes.reduce(0, combine: +)
    return(sum)
}

let classic = benchmark("Problem 6 Classic:", body: problem10Classic)
let sieved = benchmark("Problem 6 Sieved :", body: problem10Sieve)

print(String(format: "%.2f", (classic - sieved) / classic * 100) + "% difference")

// CORRECT ANSWER: 142913828922

