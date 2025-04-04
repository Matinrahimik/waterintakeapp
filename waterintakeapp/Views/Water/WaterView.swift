//
//  WaterView.swift
//  waterintakeapp
//
//  Created by Matin Rahimi on 2025-04-04.
//

import SwiftUI

struct WaterView: View {
    @State private var waterIntake: Double = 3
    @State private var dailyGoal: Double = 10
    @State private var points: Int = 125
    @State private var streak: Int = 7
    @State private var todaysChallenge: String = "Drink 8 cups of water before 6 PM"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 12) {
                    // Header - Typography Refined
                    HStack {
                        Text("Water")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding([.horizontal, .top])
                    
                    // Today's challenge card - Typography Refined
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "trophy.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.yellow)
                            
                            Text("Today's Challenge")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("+20 pts")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundColor(.yellow)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    Capsule()
                                        .fill(Color.white.opacity(0.2))
                                )
                        }
                        
                        Text(todaysChallenge)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.white)
                            .padding(.bottom, 4)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                    .padding(.horizontal)
                    
                    // Progress card - Typography Refined
                    VStack(spacing: 16) {
                        // Simplified progress header
                        HStack {
                            Text("Today's Progress")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("\(Int(waterIntake))/\(Int(dailyGoal))")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundColor(.blue)
                        }
                        
                        // Water cups visualization - 2 rows of 5 drops each
                        VStack(spacing: 16) {
                            // First row - 5 drops
                            HStack {
                                ForEach(0..<5, id: \.self) { index in
                                    Image(systemName: index < Int(waterIntake) ? "drop.fill" : "drop")
                                        .foregroundColor(.blue)
                                        .opacity(index < Int(waterIntake) ? 1.0 : 0.3)
                                        .font(.system(size: 28))
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.horizontal)
                            
                            // Second row - 5 drops
                            HStack {
                                ForEach(5..<10, id: \.self) { index in
                                    Image(systemName: index < Int(waterIntake) ? "drop.fill" : "drop")
                                        .foregroundColor(.blue)
                                        .opacity(index < Int(waterIntake) ? 1.0 : 0.3)
                                        .font(.system(size: 28))
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 8)
                        
                        // Simple progress bar
                        ZStack(alignment: .leading) {
                            // Background
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 8)
                                .foregroundColor(Color.blue.opacity(0.2))
                            
                            // Progress
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: CGFloat(waterIntake / dailyGoal) * UIScreen.main.bounds.width * 0.8, height: 8)
                                .foregroundColor(.blue)
                                .animation(.easeOut, value: waterIntake)
                        }
                        
                        // Simple numeric percentage
                        Text("\(Int(waterIntake * 100 / dailyGoal))% Complete")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.secondary)
                            .padding(.top, 4)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                    )
                    .padding(.horizontal)
                    
                    // Stats cards - Apple-like redesign
                    HStack(spacing: 10) {
                        // Points card
                        ZStack(alignment: .topTrailing) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Points")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.secondary)
                                
                                Text("\(points)")
                                    .font(.system(size: 34, weight: .semibold, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.yellow)
                                    
                                    Text("Level 3")
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.systemBackground))
                                    .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                            )
                            
                            // Points increase indicator in top right corner
                            Text("+15")
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .foregroundColor(.blue)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue.opacity(0.1))
                                )

                                .padding(12)
                        }
                        
                        // Streak card
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Current Streak")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.secondary)
                            
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("\(streak)")
                                    .font(.system(size: 34, weight: .semibold, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                Text("days")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 2)
                            }
                            
                            HStack(spacing: 4) {
                                Image(systemName: "flame.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.orange)
                                
                                Text("Best: 12 days")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color(.systemBackground))
                                .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                        )
                    }
                    .padding(.horizontal)
                    
                    // Spacer to push content up above the fixed button
                    Spacer(minLength: 80)
                }
            }
            .background(Color.blue.opacity(0.05).ignoresSafeArea())
            
            // Fixed Add water button - Typography Refined
            Button(action: {
                if waterIntake < dailyGoal {
                    waterIntake += 1
                }
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 18))
                    Text("Add 1 Cup")
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    Capsule()
                        .fill(Color.blue)
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                )
                .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
    }
}

struct ProgressBar: View {
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.2)
                    .foregroundColor(.blue)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.blue)
                    .animation(.easeOut, value: value)
            }
        }
    }
}

#Preview {
    WaterView()
} 