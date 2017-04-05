//
//  main.swift
//  BaseCode
//
//  Created by Gregory Thomas Croisdale on 4/3/17.
//  Copyright © 2017 L&N STEM Academy. All rights reserved.
//

import Foundation

extension Int {
    var array: [Int] {
        return description.characters.flatMap{Int(String($0))}
    }
}

// Prints menu options
func menu()
{
    print("Operation      Option")
    print("To base from 10   1")
    print("To 10 from base   2")
    print("To hex from bin   3")
    print("To bin from hex   4")
    print("Base addition     5")
    print("Quit              0")
    print("")
}

// Creates subscript integers as String
func sub(_ input: Int) -> String
{
    var out = ""
    for i in input.array
    {
        out += String(describing: UnicodeScalar(UInt32(("208" + String(i)), radix: 16)!)!)
    }
    return out
}

// Converts integer to unicode
func uni(_ input: Int) -> String
{
    var out = ""
    for _ in input.array
    {
        out += String(describing: UnicodeScalar(UInt32((String(input)), radix: 16)!)!)
    }
    return out
}

// Converts decimal to specified base
func toBaseFrom10(_ num: Int, _ base: Int) -> String
{
    var con = String(num % base)
    var j = num / base
    while j != 0
    {
        con = String(j % base) + con
        j = j / base
    }
    return con + sub(base)
}

// Converts a number from given base to given base
func fromBasetoBase(_ basei: Int,_ basef: Int,_ num: Int) -> String
{
    var j = 0
    var m = Double(num.array.count) - 1.0
    for i in num.array
    {
        j += i * Int(pow(Double(basei), m))
        m -= 1
    }
    var con = String(num % basef)
    j = (j / basef)
    while j != 0
    {
        con = String(j % basef) + con
        j = j / basef
    }
    return con + sub(basef)
}

// Converts a number from a specified base to decimal
func to10FromBase(_ num: Int, _ base: Int) -> Int
{
    var j = 0
    var m = Double(num.array.count) - 1.0
    for i in num.array
    {
        j += i * Int(pow(Double(base), m))
        m -= 1
    }
    return j
}

// Converts binary to hexadecimal
func binToHex(_ bin: Int)
{
    var out = Array(repeating: [Int](), count: bin.array.count / 4)
    for i in 0...bin.array.count - 1
    {
        out[i/4].append(bin.array[i])
    }
    print(out)
}

// Repeated selector code
while true{
    menu()
    switch readLine()!{
    case "0":
        exit(0)
    case "1":
        print("Enter a number in base 10: ")
        let num = Int(readLine()!)!
        print("Enter base to convert to: ")
        let base = Int(readLine()!)!
        print(toBaseFrom10(num, base))
    case "2":
        print("Enter number: ")
        let num = Int(readLine()!)!
        print("Enter original base: ")
        let base = Int(readLine()!)!
        print(String(to10FromBase(num, base)) + sub(10))
    case "3":
        print("Enter binary number: ")
        binToHex(Int(readLine()!)!)
    case "4":
        break
    case "5":
        break
    case "6":
        let basei = Int(readLine()!)!
        let basef = Int(readLine()!)!
        print(fromBasetoBase(basei, basef, Int(readLine()!)!))
    default:
        print("Please enter a valid selection . . .")
    }
}
