//
//  CalcButtonsView.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/4/23.
//

import SwiftUI

struct CalcButtonsView: View {
    
    @ObservedObject var calcApp = CalcApp()
    
    var body: some View {
        ForEach(calcApp.buttons, id: \.self) { row in
            HStack(spacing: 0) {
                ForEach(row, id: \.self) { item in
                    Button(action: {
                        calcApp.buttonInput(item: item)
                    }, label: {
                        Text(item.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size:16))
                            .frame(
                                width: calcApp.buttonWidth(item: item),
                                height: calcApp.buttonHeight()
                            )
                            .background(item.buttonColor)
                            .border(Color.black, width: 1)
                            //.cornerRadius(buttons.buttonWidth(item: item)/2)
                    })
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct CalcButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalcButtonsView()
    }
}
