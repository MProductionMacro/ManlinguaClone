//
//  HandleButtonClick.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

class HandleButtonClick: ObservableObject {
    @Published var clicked: Bool = false
    var correctAnswerIndex: Int
    
    @Published var foregroundColors: [Color] = [.black, .black, .black, .black]

    init(correctAnswerIndex: Int) {
        self.correctAnswerIndex = correctAnswerIndex
    }

    func handleButtonClick(index: Int, colors: inout [Color]) {
        for i in 0..<colors.count {
            colors[i] = .white
            foregroundColors[i] = .black
        }
        colors[index - 1] = .orange3
        foregroundColors[index - 1] = .white
//        guard !clicked else { return }
//        
//        clicked = true
//        
//        if index == correctAnswerIndex {
//            colors[index - 1] = .orange3
//            foregroundColors[index - 1] = .white
//        } else {
//            colors[index - 1] = .red
//            foregroundColors[index - 1] = .white
//            colors[correctAnswerIndex - 1] = .green
//            foregroundColors[correctAnswerIndex - 1] = .white
//        }
    }
}