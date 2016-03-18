import Foundation

/* Problem 1 --
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.

The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000. */

public func problem1Classic() -> Int {
    // Classic Programming
    var sum = 0
    for var i = 0; i < 1000; i++ {
        if ((i % 3) == 0) || ((i % 5) == 0) {
            //print(i)
            sum += i
        }
    }
    return(sum)
}

public func problem1Functional() -> Int {
    // Functional Refactor
    let sum = Array(1...999).filter(){ number in number.isAMultipleOf(3) || number.isAMultipleOf(5) }.reduce(0, combine: +)
    return (sum)
}

let classic = benchmark("Problem 1 Classic   :", body: problem1Classic)
let functional = benchmark("Problem 1 Functional:", body: problem1Functional)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// CORRECT ANSWER: 233168
