//
//  MainTabView.swift
//  waterintakeapp
//
//  Created by Matin Rahimi on 2025-04-04.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WaterView()
                .tabItem {
                    Label("Water", systemImage: "drop.fill")
                }
                .tag(0)
            
            SocialView()
                .tabItem {
                    Label("Social", systemImage: "person.3.fill")
                }
                .tag(1)
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
} 