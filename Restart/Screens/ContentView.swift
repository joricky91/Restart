//
//  ContentView.swift
//  Restart
//
//  Created by Jonathan Ricky on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
        .animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
    }
}

#Preview {
    ContentView()
}
