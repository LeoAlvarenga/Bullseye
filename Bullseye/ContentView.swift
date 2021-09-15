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
    @State var knocking: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to my first app!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    consoleLogging(value: "Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up!"), dismissButton: .default(Text("Awesome!"))
                    )
                }
            }
            Button(action: {
                consoleLogging(value: "knocking")
                self.knocking = true
            }) {
                Text("Knock, Knock!")
            }
            .alert(isPresented: $knocking) { () -> Alert in
                return Alert(title: Text("Who's There?"), message: Text("A Swift developer!"), dismissButton: .default(Text("Good one!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func consoleLogging(value: String) -> Void {
    print(value)
}
