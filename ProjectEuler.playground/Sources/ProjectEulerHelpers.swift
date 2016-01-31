//
//  ProjectEulerHelpers.swift
//  
//
//  Created by Gabe Hoffman on 1/28/16.
//
//

import Foundation


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
    
    func factors() -> [Int] {
        let maxCheck = self
        var set: [Int] = []
        if ( self == 0 ) {
            return set
        }
        for i in 1...maxCheck {
            if i.isAFactorOf(self) {
                set.append(i)
            }
        }
        return set.sort(<)
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
    
}