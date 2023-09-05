//
//  MainView.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/2/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var calcApp = CalcApp()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer()
                //Display
                CalcDisplayView(calcApp: calcApp)
                
                //Buttons
                CalcButtonsView(calcApp: calcApp)
                }
            }
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
