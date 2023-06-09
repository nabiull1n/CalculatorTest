//
//  CalculationModel.swift
//  Calculator
//
//  Created by Денис Набиуллин on 02.01.2023.
//

import Foundation

class CalculationModel {
    
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    
    public func setNumber(number: Int) {
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }
        if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        currentNumber.append(String(number))
    }
    public func getCurrentNumber() -> String {
        currentNumber.stringWithPoint
    }
    public func setOperation(operation: Operations) -> String {
        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "" }
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else { return "" }
            firstNumber = result
        }
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction.stringWithPoint
    }
    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        var result = 0.0
        switch currentOperation {
        case .noAction:
            print("noAction")
            return ""
        case .addition:
            result = firstNumber + secondNumber
        case .substraction:
            result = firstNumber - secondNumber
        case .multyplication:
            result = firstNumber * secondNumber
        case .division:
            if secondNumber == 0 {
                return "Не определено"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }
    public func resultValues() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
    }
    public func invertValue() {
        guard let number = Double(currentNumber) else { return }
        if number > 0 {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else {
            currentNumber.remove(at: currentNumber.startIndex)
        }
    }
    public func addPointValue() {
        currentNumber += currentNumber != "" ? "." : "0."
    }
    
    public func setPercentNumber() {
        guard let number = Double(currentNumber) else { return }
        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
