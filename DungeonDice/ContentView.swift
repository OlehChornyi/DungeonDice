//
//  ContentView.swift
//  DungeonDice
//
//  Created by Oleh on 17.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    
    var body: some View {
        GeometryReader(content: { geo in
            VStack {
                titleView
                
                Spacer()
                
                resultMessageView
                
                Spacer()
                
                ButtonLayout(resultMessage: $resultMessage)
                
            }
            .padding()
        })

    }
}

extension ContentView {
    private var titleView: some View {
        Text("Dungeon Dics")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.red)
    }
    
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}


#Preview {
    ContentView()
}
