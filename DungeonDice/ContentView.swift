//
//  ContentView.swift
//  DungeonDice
//
//  Created by Oleh on 17.01.2025.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    @State private var resultMessage = ""
    
    var body: some View {
        VStack {
            Text("Dungeon Dics")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            
            Button("\(Dice.four.rawValue)-sided") {
                resultMessage = "You've rolled \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice"
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    func rollingDice() {}
    
}

#Preview {
    ContentView()
}
