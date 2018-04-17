//
//  main.swift
//  Calculator
//
//  Created by Aron Ockerse on 4/18/2018.
//  Copyright © 2018 Aron Ockerse. All rights reserved.
//

import Foundation

// checks operation
var checkInput = 0

// more checkers
var check = false
var bill = 0

// final total
var total: Double = 0

// checks if calculator started
var start = 0

// used for numbers and operation
var retInt: Double = 0

// total after operation
var sum = 0

// numbers for operations
var myInt1: Double = 0
var myInt2: Double = 0

/*********************************************************************************
 * The operation() funciton returns the operation number the user wants
 *
 * @return retInt returns operation number
 *********************************************************************************/
func operation() -> Int{
    checkInput = 0
    
    // check if this is the first operation
    while (checkInput == 0){
        
        print("\n (1 Add) (2 Sub) (3 Mult) (4 Div) (5 Pow) (6 CLR) (7 Quit) \n")
        // sets temp3 to user input
        let temp3 = Double(readLine(strippingNewline: true)!)
        
        if let temp3 = temp3{
            let retInt = temp3
            // chekcs if retInt is a valid input
            if (retInt > 0 && retInt < 8){
                if (retInt == 1){
                        print("< Addition >")
                    }else if (retInt == 2){
                        print("< Subtraction >")
                    }else if (retInt == 3){
                        print("< Multiplication >")
                    }else if (retInt == 4){
                        print("< Division >")
                    }else if (retInt == 5){
                        print("< Power >")
                    }else if (retInt == 6){
                        print("< Clear >\n")
                    }else if (retInt == 7){
                        print("< Quit >")
                }
                checkInput = 1
                return Int(retInt)
        }
            print("Not a Valid Input")
    }else{
            print("Not a Valid Input")
        }
    }
  return 0
}

/*********************************************************************************
 * Asks user for second number
 *
 * @return retInt returns second double
 *********************************************************************************/
func getInt2() -> Double{
    checkInput = 0
    // checks if it is the second input
    while (checkInput == 0){
        print("\nEnter second number")
        // sets user input to temp2
        let temp2 = Double(readLine(strippingNewline: true)!)
        if let temp2 = temp2{
            let retInt = temp2
            checkInput = 1
            return retInt
        }else{
            print("\nNot a Valid Input\n")
        }
    }
    
    return 0
}

/*********************************************************************************
 * Asks user for first number
 *
 * @return retInt returns a double
 *********************************************************************************/
func getInt1() -> Double{
    print("Enter first number")
    // sets user input to temp
    let temp = Double(readLine(strippingNewline: true)!)
    if let temp = temp{
        let retInt = temp
        check = true
        return retInt
     }
        print("\nNot a Valid Input\n")
        return 0
}


/*********************************************************************************
 * Executes calculations from switch cases
 *********************************************************************************/
func doMyOperation(){
    
    if (start == 0 ){
        myInt1 = (Double(getInt1()))
        if(check){
           check = false
            let retInt = operation()
            bill = retInt
            
            if (retInt != 6 && retInt != 7)  {
                
                myInt2 = (Double(getInt2()))
                
                switch retInt{
                    
                // addition
                case 1:
                    let sum = (myInt1 + myInt2)
                    print("")
                    print("     Answer --> ",myInt1, " + ", myInt2, " = ", sum)
                    print("")
                    print("")
                    total += sum
                    start += 1
                    
                // subtraction
                case 2:
                    let sum = (myInt1 - myInt2)
                    print("")
                    print("     ",myInt1, " - ", myInt2, " = ", sum)
                    print("")
                    total += sum
                    start += 1
                    
                // multiplication
                case 3:
                    let sum = (myInt1 * myInt2)
                    print("")
                    print("     ",myInt1, " * ", myInt2, " = ", sum)
                    print("")
                    total += sum
                    start += 1
                    
                // division
                case 4:
                    
                    // checking if dividing by 0
                    if(retInt == 4 && myInt2 == 0){
                        print("\n**** Can't Divide by Zero ****\n\n")
                    }else{
                        let sum = (myInt1 / myInt2)
                        print("")
                        print("     ",myInt1, " / ", myInt2, " = ", sum)
                        print("")
                        total += sum
                        start += 1
                 
                    }
                
                // power
                case 5:
                    print("")
                    let sum = pow((myInt1),myInt2)
                    print("")
                    print("     ",myInt1, " ^ ", myInt2, " = ", sum)
                    print("\n")
                    total += sum
                    start += 1
                
                // if none of the switch cases executes
                default:
                    print("\nLet's Try This Again\n")
                }
            }
        }
    
    }

    // checks if this is not the first operation
    else if (start != 0 ){
        print("")
        let retInt = operation()
        bill = retInt
        
        // clears calculator
        if (retInt == 6){
            start = 0
            total = 0
        }
        else if (retInt != 7){
            myInt2 = (Double(getInt2()))
            
            switch retInt{
                
            // addition
            case 1:
                let sum = (total + myInt2)
                print("")
                print("     Answer--> ",total, " + ", myInt2, " = ", sum)
                print("")
                print("")
                total = 0
                total += sum
                start += 1
            
            // subtraction
            case 2:
                let sum = (total - myInt2)
                print("")
                print("     ",total, " - ", myInt2, " = ", sum)
                print("")
                total = 0
                total += sum
                start += 1
                
            // multiplication
            case 3:
                let sum = (total * myInt2)
                print("")
                print("     ",total, " * ", myInt2, " = ", sum)
                print("")
                total = 0
                total += sum
                start += 1
                
            // division
            case 4:
                
                // checks if dividing by 0
                if(retInt == 4 && myInt2 == 0){
                    print("\n**** Can't Divide by Zero ****\n")
                }else{
                    let sum = (total / myInt2)
                    print("")
                    print("     ",total, " / ", myInt2, " = ", sum)
                    print("")
                    total = 0
                    total += sum
                    start += 1
                }
                
            // power
            case 5:
                print("")
                let sum = pow((total),myInt2)
                print("")
                print("     ",total, " ^ ", myInt2, " = ", sum)
                total = 0
                total += sum
                start += 1
                
            default:
                print("\nThat is not one of your choices\n")
            }
        }else if (retInt == 7){
        }
    }
}


print("               Aron's Calculator")
print("")

while (bill != 7 ){
    doMyOperation()
}
print("\n     << Calculator OFF >>\n\n")


