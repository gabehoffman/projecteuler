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
    
    func largestPrimeFactor() -> Int? {
        return self.primeFactors().last
    }
    
    func primeFactors() -> [Int] {
        let maxCheck = Int(sqrt(Double(self)))
        var set: [Int] = []
        if ( self == 0 || self == 1 ) {
            return set
        }
        if ( self == 2 || self == 3 ) {
            return set
        }
        for i in 2...maxCheck {
            if i.isAFactorOf(self) {
                if i.isPrime() {
                    set.append(i)
                }
            }
        }
        return set.sort(<)
    }
    
    func isAFactorOf(num: Int) -> Bool {
        if ( self == 0 ) {
            return false
        }
        return (num % self) == 0
    }
    
    func task3MaxPrimeFactor() -> Int {
        
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
    
}