//
//  UIDevice.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/6/23.
//

import Foundation
import SwiftUI

#if os(iOS)
extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
#endif
