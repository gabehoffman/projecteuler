//
//  ProjectEulerHelpers.swift
//  
//
//  Created by Gabe Hoffman on 1/28/16.
//
//

import Foundation

infix operator ^^ { }
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

// Helper Functions

public extension Int {
    
    func squared() -> Int {
        return self * self
    }
    
    func isAMultipleOf(m: Int) -> Bool {
        if self == 0 {
            return false
        } else {
            return (self % m) == 0
        }
    }
    
    func isEven() -> Bool {
        if self == 0 {
            return false
        } else {
            return self.isAMultipleOf(2)
        }
    }
    
    func isOdd() -> Bool {
        if self == 0 {
            return false
        } else {
            return !self.isEven()
        }
    }
    
    func isAFactorOf(num: Int) -> Bool {
        if ( self == 0 ) {
            return false
        }
        return (num % self) == 0
    }
    
    func factorsOld() -> [Int] {
        if ( self == 0 ) {
            return []
        }
        return (1...self).filter( { self % $0 == 0 } )
    }
    
    func factors() -> [Int] {
        
        var result = [Int]()
        let mySqrt = Int(sqrt(Double(self)))
        
        for factor in (1...mySqrt).filter( { self % $0 == 0 } ) {
            
            result.append(factor)
            
            if self/factor != factor { result.append(self/factor) }
        }
        
        return result.sort(<)
        
    }
    
    func factorCount() -> Int {
        return self.factors().count
    }
    
    func firstNFactors(n: Int) -> [Int] {
        var set: [Int] = []
        if ( self == 0 ) {
            return set
        }
        for i in 1...n {
            if i.isAFactorOf(self) {
                set.append(i)
            }
        }
        return set.sort(<)
    }
    
    func hasFirstNFactors(n: Int) -> Bool {
        if ( self == 0 ) {
            return false
        }
        for i in 1...n {
            if i.isAFactorOf(self) {
                continue
            } else {
                return false
            }
        }
        return true
    }
    
    func isPrime() -> Bool {
        let maxCheck = Int(sqrt(Double(self)))
        if ( self == 0 || self == 1 ) {
            return false
        }
        if ( self == 2 || self == 3 ) {
            return true
        }
        for i in 2...maxCheck {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
    
    func primesLessThanMe() -> [Int] {
        var primes: [Int] = []
        if ( self == 0 || self == 1 ) {
            return primes
        }
        for i in 2...self {
            if i.isPrime() {
                primes.append(i)
            }
        }
        return primes
    }
    
    func primeFactors() -> [Int] {
        let maxCheck = Int(sqrt(Double(self)))
        var array: [Int] = []
        if ( self == 0 || self == 1 ) {
            return array
        }
        if ( self == 2 || self == 3 ) {
            return array
        }
        for i in 2...maxCheck {
            if i.isAFactorOf(self) {
                if i.isPrime() {
                    array.append(i)
                }
            }
        }
        return array.sort(<)
    }
    
    func largestPrimeFactor() -> Int? {
        return self.primeFactors().last
    }
    
    func maxPrimeFactor() -> Int {
        
        var primeFactors = [Int]()
        var num = self
        repeat{
            
            var primeIsFound = false
            var primeFactor = 2
            repeat{
                if(num % primeFactor == 0){
                    primeIsFound = true
                    primeFactors.append(primeFactor)
                    num = num / primeFactor
                }
                primeFactor++
                
            }while(!primeIsFound)
            
        } while(num > 1)
        
        
        //return largest prime factor
        return primeFactors.maxElement()!
    }
 
    func sieve() -> [Int] {
        guard self > 1 else {
            return []
        }
        
        var primes =  [Bool](count: self+1, repeatedValue: true)
        
        for i in 0..<2 {
            primes[i] = false
        }
        
        for j in 2..<primes.count where primes[j] {
            for var k = 2; k*j < primes.count; k++ {
                primes[k*j] = false
            }
        }
        
        return primes.enumerate().flatMap { (index: Int, element: Bool) -> Int? in
            if element {
                return index
            }
            return .None
        }
    }

    func isPalindrome() -> Bool {
        var palindrome: [String] = []
        var number = self
        while number > 0 {
            palindrome.append(String(number % 10))
            number /= 10
        }
        //print(palindrome)
        return (palindrome == palindrome.reverse())
    }
    
    func hasAPythagoreanTriplet() -> Bool {
        let cSquared = self.squared()
        var foundATriplet = false
        for i in 1..<self {
            for j in 1..<i {
                let aSquared = i.squared()
                let bSquared = j.squared()
                if aSquared + bSquared == cSquared {
                    foundATriplet = true                }
            }
        }
        return foundATriplet
    }
    
    // Returns 0 if no triplet exisits
    func sumOf1stPythagoreanTriplet() -> Int {
        let c = self
        let cSquared = c.squared()
        var a = 0, b = 0
        for i in 1..<self {
            for j in 1..<i {
                let aSquared = i.squared()
                let bSquared = j.squared()
                if aSquared + bSquared == cSquared {
                    a = i
                    b = j
                }
            }
        }
        let sum = a + b + c
        if a != 0 || b != 0 {
            return (sum)
        } else {
            return (0)
        }
    }
    
    func pythagoreanTriplets() -> [(a: Int, b: Int, c: Int)] {
        var triplets: [(a: Int, b: Int, c: Int)] = []
        let c = self
        let cSquared = c.squared()
        var a = 1, b = 1
        for i in 1..<self {
            for j in 1..<i {
                let aSquared = i.squared()
                let bSquared = j.squared()
                if aSquared + bSquared == cSquared {
                    a = j
                    b = i
                    triplets.append((a: a, b: b, c: c))
                    let sum = a + b + c
                    if sum == 1000 {
                        print("Found special triplet, a:\(a), b:\(b), c:\(c) || Product = \(a * b * c)")
                    }
                }
            }
        }
        return (triplets)
    }
    
    func triangleNumber() -> Int {
        var triangle = 0
        if ( self == 0 ) {
            return 0
        }
        if ( self == 1 ) {
            return 1
        }
        for i in 1...self {
            triangle += i
        }
        //print(triangle)
        return triangle
    }
    
    func triangleNumbers() -> [Int] {
        var sequence: [Int] = []
        if ( self == 0 ) {
            return sequence
        }
        if ( self == 1 ) {
            return [1]
        }
        for i in 1...self {
            sequence.append(i.triangleNumber())
        }
        //print(sequence)
        return sequence
    }
    
    func triangleNumbers(startingWith: Int) -> [Int] {
        var sequence: [Int] = []
        let count = startingWith + self
        if ( self == 0 ) {
            return sequence
        }
        if ( self == 1 ) {
            return [1]
        }
        for i in startingWith...count {
            sequence.append(i.triangleNumber())
        }
        //print(sequence)
        return sequence
    }
    
    func collatzChainLength() -> Int {
        var length = 0
        //print(self)
        let nextCollatzTransformation = self.collatzTransformation()
        if  nextCollatzTransformation == 1 {
            return 2
        } else {
            length++ 
            length += nextCollatzTransformation.collatzChainLength()
        }
        
        return length
    }
    
    func collatzTransformation() -> Int {
        if self.isEven() {
            //print(self / 2)
            return self / 2
        } else {
            //print(self * 3 + 1)
            return self * 3 + 1
        }
    }
}