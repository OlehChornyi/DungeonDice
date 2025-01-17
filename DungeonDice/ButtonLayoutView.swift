//
//  ButtonLayoutView.swift
//  DungeonDice
//
//  Created by Oleh on 17.01.2025.
//

import SwiftUI

struct ButtonLayout: View {
    enum Dice: Int, CaseIterable {
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
    struct deviceWidthPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
        
        typealias Value = CGFloat
        
        
    }
    
    @State private var buttonsLeftOver = 0
    @Binding var resultMessage: String
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0
    let buttonWidth: CGFloat = 102
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)], content: {
                ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You've rolled \(dice.roll()) on a \(dice.rawValue)-sided dice"
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .frame(width: buttonWidth)
                }
            })
            HStack {
                ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You've rolled \(dice.roll()) on a \(dice.rawValue)-sided dice"
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .frame(width: buttonWidth)
                }
            }
        }
        .overlay {
            GeometryReader { geo in
                Color.clear
                    .preference(key: deviceWidthPreferenceKey.self, value: geo.size.width)
            }
        }
        .onPreferenceChange(deviceWidthPreferenceKey.self, perform: { deviceWidth in
            arrangeGridItems(deviceWidth: deviceWidth)
        })
    }
    
    func arrangeGridItems(deviceWidth: CGFloat) {
        var screenWidth = deviceWidth - horizontalPadding*2
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        
        let numberOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numberOfButtonsPerRow
    }
}


#Preview {
    ButtonLayout(resultMessage: .constant(""))
}
