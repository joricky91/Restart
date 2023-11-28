//
//  OnboardingHeaderView.swift
//  Restart
//
//  Created by Jonathan Ricky on 28/11/23.
//

import SwiftUI

struct OnboardingHeaderView: View {
    @Binding var textTitle: String
    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text(textTitle)
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .transition(.opacity)
                .id(textTitle)
            
            Text("""
                It's not how much we give but
                how much love we put into giving
            """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
    }
}

//#Preview {
//    OnboardingHeaderView()
//}
