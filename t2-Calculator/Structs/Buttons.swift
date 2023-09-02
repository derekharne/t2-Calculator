//
//  Buttons.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/2/23.
//

import Foundation
import SwiftUI

struct Buttons {
    
    let buttons: [[CalcButton]] = [
        [.ac, .plusminus, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    func buttonWidth (item: CalcButton) -> CGFloat {
        #if os(iOS)
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
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
    
}
