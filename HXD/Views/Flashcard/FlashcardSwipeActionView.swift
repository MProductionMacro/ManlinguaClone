//
//  FlashcardSwipeActionView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 13/08/24.
//

import SwiftUI

struct FlashcardSwipeActionView: View {
    var body: some View {
        VStack (spacing: 4) {
            FlashcardSwipeView()
            HStack {
                PreviousButton()
                Spacer()
                NextButton()
            }
        }
        .padding()
        
    }
}

#Preview {
    FlashcardSwipeActionView()
}
