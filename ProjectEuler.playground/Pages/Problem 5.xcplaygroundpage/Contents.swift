import Foundation

/* Problem 5 --
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

var number = 0
var found = false
var muliplier = 1
var steps = 0
let numberOfFactorsToCheck = 12

public func problem5BruteForce() -> Int {
    // Brute Force Method works until about 16
    muliplier = numberOfFactorsToCheck
    repeat {
        number += muliplier
        found = number.hasFirstNFactors(numberOfFactorsToCheck )
        steps++
    } while !found
    
    steps
    return(number)
}

public func problem5Refactored() -> Int {
    // Create a large common multiple, then try multiples of that
    // tremendoulsy more effiecent than brute force
    // This is solution is based off intuition, I can't prove the math of it :)
    // Produces incorrect result under 11 factors
    steps = 0
    number = 0
    muliplier = numberOfFactorsToCheck
    let primeFactors = numberOfFactorsToCheck.primesLessThanMe()
    for prime in primeFactors.indices {
        muliplier *= primeFactors[prime]
    }
    
    repeat {
        number += muliplier
        found = number.hasFirstNFactors(numberOfFactorsToCheck)
        steps++
    } while !found
    
    steps
    
    return(number)
}

let classic = benchmark("Problem 5 Brute Force:", body: problem5BruteForce)
let functional = benchmark("Problem 5 Refactored:", body: problem5Refactored)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// Correct Answer: 232792560

