//
//  StatsView.swift
//  waterintakeapp
//
//  Created by Matin Rahimi on 2025-04-04.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Text("Statistics")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "chart.bar.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
            
            Text("View your hydration statistics")
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    StatsView()
} 