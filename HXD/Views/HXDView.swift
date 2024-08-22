//
//  HXDView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct HXDView: View {
    @State var Opacity: Double = 0.0
    @ObservedObject var homeViewModel : HomeViewModel
    
    var body: some View {
        ZStack {
            switch homeViewModel.currentStage{
            case .open:
                SplashScreenView()
                HomePage(homeViewModel:homeViewModel)
                    .opacity(Opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeIn(duration: 0.5)) {
                                Opacity = 1.0
                            }
                        }
                    }
            case .home:
                HomePage(homeViewModel:homeViewModel)
                    .opacity(Opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeIn(duration: 0.5)) {
                                Opacity = 1.0
                            }
                        }
                    }
            case .dictionary:
                Text("dict")
            case .outlineStory:
                Text("outline")
            case .story:
                StoryView(homeViewModel: homeViewModel)
            }
          
        }
    }
}

#Preview {
    HXDView(homeViewModel: HomeViewModel())
}