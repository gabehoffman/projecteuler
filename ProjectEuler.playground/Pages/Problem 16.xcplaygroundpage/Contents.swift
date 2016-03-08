import Foundation

/* Problem 16 

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

*/

/* So Swift doesn't have BigInts, and though you can easily extend it to include them, I felt this was missing the point of the problem.
    I solved it using the spirit of the problem to find a simple iterative approach to get around the limitations of any Int values.

*/

// because 2^4 is the same as 2^2^2
pow(2.0, 4)
pow((pow(2.0,2)),2)

// loop through each digit in an Int Array and square it 1000 times
// making sure to carry signifcant numbers to the left

let power: Int = 1000 // Change to 1000 to find real answer
var twoPower1000: [Int] = [2]

for i in 1..<power {
    var carry = true
    var carryAmount = 0
    for var j = twoPower1000.count-1; j >= 0; j-- {
        var temp = twoPower1000[j] * 2
        if carry {
            carry = false
            temp += carryAmount
        }
        var ones = temp % 10
        var tens = temp / 10
        twoPower1000[j] = ones
        if j == 0 && tens > 0 {
            twoPower1000.insert(tens, atIndex: 0)
        } else if tens > 0 {
            carry = true
            carryAmount = tens
        }
    }
    //print("2 to the \(i+1) power is \(concatinateIntArray(twoPower1000))")
}

func concatinateIntArray(arr: [Int]) -> String {
    var string: String = ""
    for i in arr {
        string.appendContentsOf("\(i)")
    }
    return string
}

func sumIntArray(arr: [Int]) -> Int {
    var sum: Int = 0
    for i in arr {
        sum += i
    }
    return sum
}


print(concatinateIntArray(twoPower1000))
print(sumIntArray(twoPower1000))

// CORRECT ANSWER is 1366