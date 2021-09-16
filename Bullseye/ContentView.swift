//
//  ContentView.swift
//  Bullseye
//
//  Created by Leonardo Alvarenga on 14/09/21.
//  Copyright © 2021 Leonardo Alvarenga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                //Target Row
                HStack {
                    Text("Put the bullseye as colse as you can to:")
                    Text("\(self.target)")
                }
                Spacer()
                
                // Slider Row
                HStack {
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                .padding(.horizontal, 10)
                Spacer()
                
                // Button Row
                Button(action: {
                    self.consoleLogging(value: "Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    var roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello There!"), message: Text(
                        "The slider's value is \(roundedValue).\n" +
                        "You scored \(self.pointsForCurrentRound()) points this round."
                        ), dismissButton: .default(Text("Awesome!"))
                    )
                }
                Spacer()
                
                // Score Row
                HStack {
                    Button(action: {}) {
                        Text("Start over")
                    }
                    Spacer()
                    Text("Score:")
                    Text("999")
                    Spacer()
                    Text("Round")
                    Text("999")
                    Spacer()
                    Button(action: {}) {
                        Text("Info")
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
            }
        }
    }
    
    func pointsForCurrentRound() -> Int {
        var result: Int = self.target - Int(self.sliderValue)
        return 100 - Int(result.magnitude)
    }

    func consoleLogging(value: String) -> Void {
        print(value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

