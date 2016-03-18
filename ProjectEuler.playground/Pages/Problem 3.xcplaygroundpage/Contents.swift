import Foundation

/* Problem 3 --
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

var n = 600851475143

public func problem3aClassic() -> Int {
    return n.primeFactors().maxElement()!
}

public func problem3bClassic() -> Int {
    return n.largestPrimeFactor()!
}

public func problem3Functional() -> Int {
    return n.maxPrimeFactor()
}

let classic = benchmark("Problem 3 Classic   :", body: problem3aClassic)
let classicb = benchmark("Problem 3 Classic   :", body: problem3bClassic)
let functional = benchmark("Problem 3 Functional:", body: problem3Functional)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// CORRECT ANSWER: 6857
