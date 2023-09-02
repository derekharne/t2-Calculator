//
//  MainView.swift
//  t2-Calculator
//
//  Created by Derek Harne on 9/2/23.
//

import SwiftUI

struct MainView: View {
    
    let buttons = Buttons()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer()
                //Display
                HStack {
                    Spacer()
                    Text("0")
                        .font(.system(size: 52))
                        .foregroundColor(.white)
                        .padding()
                }
                
                //Buttons
                ForEach(buttons.buttons, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                print("\(item.rawValue) pressed.")
                            }, label: {
                                Text(item.rawValue)
                                    .foregroundColor(.white)
                                    .font(.system(size:16))
                                    .frame(
                                        width: buttons.buttonWidth(item: item),
                                        height: buttons.buttonHeight()
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
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
