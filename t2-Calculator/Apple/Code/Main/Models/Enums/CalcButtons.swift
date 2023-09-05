//
//  CalcButtons.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/4/23.
//

import Foundation
import SwiftUI

enum CalcButtons: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    case equal = "="
    case ac = "AC"
    case c = "C"
    case percentage = "%"
    case plusminus = "+/-"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color(.orange)
        case .ac, .plusminus, .percentage:
            return Color(.darkGray)
        default:
            return Color(.lightGray)
        }
    }
}
