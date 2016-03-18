import Foundation

/* Problem 2 --
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/

public func problem2Classic() -> Int {
    let maxValue = 4_000_000
    var sum = 0
    var previousFibonacciNumber = 1
    var currentFibonacciNumber = 1
    while currentFibonacciNumber < maxValue {
        let nextFibonacciNumber = previousFibonacciNumber + currentFibonacciNumber
        previousFibonacciNumber = currentFibonacciNumber
        currentFibonacciNumber = nextFibonacciNumber
        if currentFibonacciNumber.isEven() {
            sum += currentFibonacciNumber
        }
}
return(sum)
}

public func problem2Functional() -> Int {
    let maxValue = 4_000_000
    let sum = FibonacciSequence(max: maxValue).filter({$0.isEven()}).reduce(0, combine: +)
    return(sum)
}

let classic = benchmark("Problem 2 Classic   :", body: problem2Classic)
let functional = benchmark("Problem 2 Functional:", body: problem2Functional)

print(String(format: "%.2f", (classic - functional) / classic * 100) + "% difference")

// CORRECT ANSWER: 4613732
