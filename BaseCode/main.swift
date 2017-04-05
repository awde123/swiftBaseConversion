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

extension String {
    var array: [String] {
        return description.characters.flatMap{String($0)}
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
    if input > 9
    {
        return String(describing: UnicodeScalar(input + 55)!)
    }
    else {return String(input)}
}

// Converts unicode to integer
func unUn(_ inp: String) -> Int
{
    if Int(inp) != nil {return Int(inp)!}
    var out = 0
    for element in inp.unicodeScalars {
        out += Int(element.value) - 55
    }
    return out
}

// Converts a number from given base to given base
func fromBasetoBase(_ basei: Int,_ basef: Int,_ inp: String) -> String
{
    var num = 0
    for h in 0...inp.array.count - 1
    {
        num += unUn(inp.array[h]) * Int(pow(10,Double(inp.array.count - 1 - h)))
    }
    
    var j = 0
    var m = Double(num.array.count) - 1.0
    for i in num.array
    {
        j += i * Int(pow(Double(basei), m))
        m -= 1
    }
    var con = uni(num % basef)
    j = (j / basef)
    while j != 0
    {
        con = uni(j % basef) + con
        j = j / basef
    }
    return con + sub(basef)
}

print(fromBasetoBase(11, 10, "167"))

/*
// Repeated selector code
while true{
    menu()
    switch readLine()!{
    case "0":
        exit(0)
    case "1":
        break
    case "2":
        break
    case "3":
        break
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
*/
