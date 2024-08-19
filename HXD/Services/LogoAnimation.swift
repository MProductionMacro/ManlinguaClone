//
//  LogoAnimation.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import SwiftUI

class LogoAnimation: ObservableObject, LogoAnimationProtocol {
    @Published var currentIndex = 0
    private let animationInterval = 1.0

    func startIntroducing(duration: Double) {
        let totalIntervals = Int(duration / animationInterval)
        animate(intervalsLeft: totalIntervals)
    }

    private func animate(intervalsLeft: Int) {
        guard intervalsLeft > 0 else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + animationInterval) {
            self.currentIndex = (self.currentIndex + 1) % 3
            self.animate(intervalsLeft: intervalsLeft - 1)
        }
    }
}
