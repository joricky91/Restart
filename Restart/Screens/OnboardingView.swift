//
//  OnboardingView.swift
//  Restart
//
//  Created by Jonathan Ricky on 27/11/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()
                
                OnboardingHeaderView(textTitle: $textTitle, isAnimating: $isAnimating)
                
                // MARK: - CENTER
                OnboardingCenterView(imageOffset: $imageOffset, isAnimating: $isAnimating, textTitle: $textTitle, indicatorOpacity: $indicatorOpacity)
                
                Spacer()
                
                // MARK: - FOOTER
                OnboardingFooterView(buttonOffset: $buttonOffset, isAnimating: $isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
