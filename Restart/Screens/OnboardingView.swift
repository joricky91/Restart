//
//  OnboardingView.swift
//  Restart
//
//  Created by Jonathan Ricky on 27/11/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }

        }
    }
}

#Preview {
    OnboardingView()
}
