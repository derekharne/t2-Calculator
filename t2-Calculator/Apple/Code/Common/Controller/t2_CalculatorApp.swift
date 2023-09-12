//
//  t2_CalculatorApp.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/2/23.
//

import SwiftUI

@main
struct t2_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
            #if os(macOS)
                .frame(width: 280, height: 450)
            #endif
        }
        #if os(macOS)
        .windowResizability(.contentSize)
        #endif
    }
}
