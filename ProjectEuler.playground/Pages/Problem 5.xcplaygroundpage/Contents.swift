import Foundation

/* Problem 5 --
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

var number = 0
var found = false
var muliplier = 1
var steps = 0
let numberOfFactorsToCheck = 20

// Select known shared multiples first, tremendoulsy more effiecent than brute force
// based off intuition, I can't prove the math of it :)

let primeFactors = numberOfFactorsToCheck.primesLessThanMe()
for prime in primeFactors.indices {
    muliplier *= primeFactors[prime]
}
repeat {
    number += muliplier
    found = number.hasFirstNFactors(numberOfFactorsToCheck)
    steps++
} while !found

print(muliplier)
print(number)
print("Found in just \(steps) steps")

number == 232792560



// Brute Force Method works until about 16
number = 0
muliplier = numberOfFactorsToCheck
repeat {
    number += muliplier
    found = number.hasFirstNFactors(numberOfFactorsToCheck)
} while found

number

var set1to10: Set = [1,2,3,4,5,6,7,8,9,10]
var set1to20: Set = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

var factors = Set(2520.factors())

factors.intersect(set1to10) == set1to10

// Correct Answer: 232792560

