//
//  CalcDisplayView.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/4/23.
//

import SwiftUI

struct CalcDisplayView: View {
    
    @ObservedObject var calcApp = CalcApp()
    
    var body: some View {
        HStack {
            Spacer()
            Text(calcApp.calcDisplay)
                //TODO:
                //Need to implment font size per device.
                .font(.system(size: 36))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct CalcDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CalcDisplayView()
    }
}
