//
//  CalcApp.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/4/23.
//

import Foundation
import SwiftUI

@MainActor class CalcApp: ObservableObject {
    @Published var calcDisplay = "0"
    @Published var calcDisplayFontSize: CGFloat
    @Published var calcButtonFontSize: CGFloat
    @Published var buttons: [[CalcButtons]] = [
        [.ac, .plusminus, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var calcValueOne: Double = 0.0
    var calcValueTwo: Double = 0.0
    var calcOperation: String = ""
    var calcResetDisplay: Bool = false
    var calcDisplayLimit: Int = 10
    
    init() {
        #if os(macOS)
        calcDisplayFontSize = 38
        calcButtonFontSize = 22
        #endif
        #if os(iOS)
        //Default iOS Values, setting to zero as no iOS device exists that isn't an iPhone or iPad, for now.
        calcDisplayFontSize = 0
        calcButtonFontSize = 0
        if UIDevice.isIPad == true {
            calcDisplayFontSize = 120
            calcButtonFontSize = 48
        }
        if UIDevice.isIPhone == true {
            calcDisplayFontSize = 44
            calcButtonFontSize = 22
        }
        #endif
    }
    
    //TODO:
    //(2) Implement keyboard input.
    //(4) Align 0 on iOS.
    //(5) Visual bug on iPad, verify on hardware.
    
    func buttonWidth (item: CalcButtons) -> CGFloat {
        #if os(iOS)
        if item == .zero {
            return ((UIScreen.main.bounds.width - (5*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
        #else
        if item == .zero {
            return 140
        }
        return 70
        #endif
    }
    
    func buttonHeight() -> CGFloat {
        #if os(iOS)
        return (UIScreen.main.bounds.width - (5*12)) / 4
        #else
        return 70
        #endif
    }
    
    func buttonInput(item: CalcButtons) {
        switch item {
        case .add, .subtract, .multiply, .divide:
            operation(item)
        case .plusminus:
            plusMinus()
        case .ac:
            allClear()
        case .c:
            clear()
        case .percentage:
            percentage()
        case .equal:
            calculate()
        default:
            inputNumber(item.rawValue)
        }
    }
    
    func operation(_ operation: CalcButtons) {
        calcValueOne = Double(calcDisplay) ?? 0
        calcOperation = operation.rawValue
        calcResetDisplay = true
    }
    
    func plusMinus() {
        if calcDisplay == "0" {
            return
        }
        var currentNumber = Double(calcDisplay) ?? 0
        currentNumber = -currentNumber
        calcDisplay = String(currentNumber)
        emptyDecimalSuffixCheck()
    }
    
    func emptyDecimalSuffixCheck() {
        if calcDisplay.hasSuffix(".0") {
            let correctedDisplay = calcDisplay.dropLast(2)
            calcDisplay = String(correctedDisplay)
        }
        return
    }
    
    func allClear() {
        calcDisplay = "0"
        calcOperation = ""
        calcValueOne = 0.0
        calcValueTwo = 0.0
        calcResetDisplay = false
    }
    
    func percentage() {
        if calcDisplay.contains(".") {
            var currentNumber = Double(calcDisplay) ?? 0
            currentNumber = currentNumber * 100
            calcDisplay = String(currentNumber)
            emptyDecimalSuffixCheck()
        }
        else {
            var currentNumber = Double(calcDisplay) ?? 0
            currentNumber = currentNumber * 0.01
            calcDisplay = String(currentNumber)
        }
    }
    
    func inputNumber(_ number: String) {
        
        if calcDisplay.contains(".") && number.contains("."){
            return
        }
        if calcDisplay.count >= calcDisplayLimit {
            return
        }
        if calcDisplay == "0" || calcResetDisplay == true {
            calcDisplay = number
            calcResetDisplay = false
        }
        else {
            calcDisplay = calcDisplay + number
        }
        
        buttons = [
            [.c, .plusminus, .percentage, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .subtract],
            [.one, .two, .three, .add],
            [.zero, .decimal, .equal]
        ]
    }
    
    func calculate() {
        
        let result: Double
        
        if calcOperation == "" {
            return
        }
        
        calcValueTwo = Double(calcDisplay) ?? 0
        switch calcOperation {
        case "+":
            result = calcValueOne + calcValueTwo
        case "-":
            result = calcValueOne - calcValueTwo
        case "x":
            result = calcValueOne * calcValueTwo
        case "÷":
            result = calcValueOne / calcValueTwo
        default:
            return
        }
        
        calcDisplay = String(result)
        emptyDecimalSuffixCheck()
        
        if calcDisplay.count >= calcDisplayLimit {
            allClear()
            calcDisplay = "Error: Too long."
        }
    }
    
    func clear() {
        calcDisplay = "0"
        
        buttons = [
            [.ac, .plusminus, .percentage, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .subtract],
            [.one, .two, .three, .add],
            [.zero, .decimal, .equal]
        ]
    }
}
