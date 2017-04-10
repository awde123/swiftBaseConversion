//
//  main.swift
//  BaseCode
//
//  Created by Gregory Thomas Croisdale on 4/3/17.
//  Copyright © 2017 L&N STEM Academy. All rights reserved.
//

import Foundation

extension Int { // Allows integers to be expressed as arrays
    var array: [Int] {
        return description.characters.flatMap{Int(String($0))}
    }
} // end of extension

extension String { // Allows strings to be expressed as arrays
    var array: [String] {
        return description.characters.flatMap{String($0)}
    }
} // end of extension

func menu() // Prints menu options
{
    print("Operation      Option")
    print("To base from 10   1")
    print("To 10 from base   2")
    print("To hex from bin   3")
    print("To bin from hex   4")
    print("Base addition     5")
    print("From base to base 6")
    print("Quit              0")
    print("###################")
} // end of function

func sub(_ input: Int) -> String // Creates subscript integers as String
{
    var out = ""
    for i in input.array
    {
        out += String(describing: UnicodeScalar(UInt32(("208" + String(i)), radix: 16)!)!)
    }
    return out
} // end of function

func uni(_ input: Int) -> String // Converts integer to unicode
{
    if input > 9
    {
        return String(describing: UnicodeScalar(input + 55)!)
    }
    else {return String(input)}
} // end of function

func unUn(_ inp: String) -> Int // Points to Unicode table from integer input
{
    if Int(inp) != nil {return Int(inp)!} // determines if unicode table need be referenced
    var out = 0
    for element in inp.unicodeScalars {
        out += Int(element.value) - 55
        print(out)
    }
    return out
} // end of function

func fromBasetoBase(_ basei: Int,_ basef: Int,_ inp: String) -> String // Universal from base to base function
{
    var t = 0
    var m = Double(inp.array.count - 1)
    for i in inp.array
    {
        t += unUn(i) * Int(pow(Double(basei), m))
        m -= 1
    }
    var out = ""
    while t != 0
    {
        out = String(uni(t % basef)) + out
        t = t / basef
    }
    return out
} // End of function
print(fromBasetoBase(10,2,"400"))
while true{ // Repeated selector code
    menu()
    switch readLine()!{
    case "0": // Quit
        exit(0)
    case "1": // To Base from 10
        print("Enter number: ")
        let num = readLine()!
        print("Enter base: ")
        let base = Int(readLine()!)!
        print(String(num) + sub(10) + " = " + fromBasetoBase(10, base, num) + sub(base))
    case "2": // To 10 from Base
        print("Enter number: ")
        let num = readLine()!
        print("Enter base: ")
        let base = Int(readLine()!)!
        print(String(num) + sub(base) + " = " + fromBasetoBase(base, 10, num) + sub(10))
    case "3": // To hex from binary
        print("Enter binary: ")
        let num = readLine()!
        print(String(num) + sub(2) + " = " + fromBasetoBase(2, 16, num) + sub(16))
    case "4": // To binary from hex
        print("Enter hex: ")
        let num = readLine()!
        print(String(num) + sub(16) + " = " + fromBasetoBase(16, 2, num) + sub(2))
    case "5": // Base addition
        print("Enter base: ")
        let base = Int(readLine()!)!
        print("Enter first number:  ")
        let num1 = readLine()!
        print("Enter second number: ")
        let num2 = readLine()!
        print("Enter third number:  ")
        let num3 = readLine()!
        print("Enter fourth number: ")
        let num4 = readLine()!
        let bases = sub(base)
        let sum10 = String(Int(fromBasetoBase(base, 10, num1))! + Int(fromBasetoBase(base, 10, num2))! + Int(fromBasetoBase(base, 10, num3))! + Int(fromBasetoBase(base, 10, num4))!) // sum in base 10
        let state = "\(num1 + bases) + \(num2 + bases) + \(num3 + bases) +\(num4 + bases)" // part of print statement
        print(state + " = \(fromBasetoBase(10, base, sum10) + bases) = \(sum10 + sub(10))")
    case "6": // Universal base changer
        print("Enter original base: ")
        let base = Int(readLine()!)!
        print("Enter original number: ")
        let num = readLine()!
        print("Enter desired base: ")
        let basef = Int(readLine()!)!
        print(num + sub(base) + " = " + fromBasetoBase(base, basef, num) + sub(basef))
    default: // If selection is invalid...
        print("Please enter a valid selection . . .")
    } // end of selector
} // end of program

