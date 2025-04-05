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
    @State private var todaysChallenge: String = "Drink a cup of water before and after each meal today"
    @State private var challengeProgress: Int = 1
    @State private var totalChallengeSteps: Int = 6
    
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
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                        
                        // Challenge steps
                        VStack(alignment: .leading, spacing: 8) {
                            ChallengeStep(text: "Morning - Drink water after waking up", isCompleted: challengeProgress > 0)
                            ChallengeStep(text: "Breakfast - Drink water before & after", isCompleted: challengeProgress > 1)
                            ChallengeStep(text: "Lunch - Drink water before & after", isCompleted: challengeProgress > 2)
                            ChallengeStep(text: "Afternoon - Hydration break", isCompleted: challengeProgress > 3)
                            ChallengeStep(text: "Dinner - Drink water before & after", isCompleted: challengeProgress > 4)
                            ChallengeStep(text: "Evening - Final cup before bed", isCompleted: challengeProgress > 5)
                        }
                        .padding(.top, 4)
                        
                        // Progress indicator
                        HStack {
                            Text("\(challengeProgress)/\(totalChallengeSteps) completed")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.9))
                            
                            Spacer()
                            
                            Button(action: {
                                if challengeProgress < totalChallengeSteps {
                                    challengeProgress += 1
                                    if waterIntake < dailyGoal {
                                        waterIntake += 1
                                    }
                                }
                            }) {
                                Text("Complete Step")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule()
                                            .fill(Color.white)
                                    )
                            }
                            .opacity(challengeProgress < totalChallengeSteps ? 1.0 : 0.5)
                            .disabled(challengeProgress >= totalChallengeSteps)
                        }
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
                            
                            Text("\(max(0, Int(dailyGoal - waterIntake))) cups remaining")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.blue)
                                .padding(.horizontal, 10 )
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue.opacity(0.1))
                                )
                        }
                        
                        // Main progress visualization - Side by side layout
                        HStack(alignment: .center, spacing: 20) {
                            // Left side: Circular progress
                            ZStack {
                                // Outer container to maintain consistent size
                                Circle()
                                    .stroke(Color.clear)
                                    .frame(width: 140, height: 140)
                                
                                Circle()
                                    .stroke(Color.blue.opacity(0.2), lineWidth: 10)
                                    .frame(width: 120, height: 120)
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(min(waterIntake / dailyGoal, 1.0)))
                                    .stroke(
                                        waterIntake >= dailyGoal ? 
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ) :
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.blue, Color(red: 0.2, green: 0.5, blue: 1.0)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                                    )
                                    .frame(width: 120, height: 120)
                                    .rotationEffect(.degrees(-90))
                                    .animation(.easeOut, value: waterIntake)
                                
                                // Second circle (always present but only visible beyond 100%)
                                Circle()
                                    .trim(from: 0, to: waterIntake > dailyGoal ? CGFloat(min((waterIntake - dailyGoal) / dailyGoal, 1.0)) : 0)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.green.opacity(0.7), Color.green]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [3, 3])
                                    )
                                    .frame(width: 140, height: 140)
                                    .rotationEffect(.degrees(-90))
                                    .animation(.easeOut, value: waterIntake)
                                
                                // Percentage text with color change
                                Text("\(Int(min(waterIntake * 100 / dailyGoal, 999)))%")
                                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                                    .foregroundColor(waterIntake >= dailyGoal ? .green : .primary)
                                
                                // Crown container to prevent layout jumps
                                ZStack {
                                    if waterIntake > dailyGoal {
                                        Image(systemName: "crown.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.yellow)
                                    }
                                }
                                .frame(width: 20, height: 20)
                                .offset(y: -36)
                            }
                            .frame(width: 140, height: 140) // Fixed outer frame
                            
                            // Right side: Quick stats
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 12) {
                                    // Current intake
                                    VStack(alignment: .center, spacing: 4) {
                                        Text("\(Int(waterIntake))")
                                            .font(.system(size: 28, weight: .bold, design: .rounded))
                                            .foregroundColor(.blue)
                                        
                                        Text("Current")
                                            .font(.system(size: 13, weight: .medium))
                                            .foregroundColor(.secondary)
                                    }
                                    .frame(minWidth: 70)
                                    
                                    // Separator
                                    Rectangle()
                                        .fill(Color.secondary.opacity(0.2))
                                        .frame(width: 1, height: 40)
                                    
                                    // Goal
                                    VStack(alignment: .center, spacing: 4) {
                                        Text("\(Int(dailyGoal))")
                                            .font(.system(size: 28, weight: .bold, design: .rounded))
                                            .foregroundColor(.primary)
                                        
                                        Text("Goal")
                                            .font(.system(size: 13, weight: .medium))
                                            .foregroundColor(.secondary)
                                    }
                                    .frame(minWidth: 70)
                                }
                            }
                                
                                
                        }
                        .padding(.vertical, 8)
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
                waterIntake += 1
                // Award bonus points for exceeding the goal
                if waterIntake > dailyGoal {
                    points += 5
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
                        .fill(waterIntake >= dailyGoal ? Color.green : Color.blue)
                        .shadow(color: (waterIntake >= dailyGoal ? Color.green : Color.blue).opacity(0.3), radius: 8, x: 0, y: 4)
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

struct ChallengeStep: View {
    var text: String
    var isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .yellow : .white.opacity(0.7))
                .font(.system(size: 14))
            
            Text(text)
                .font(.system(size: 13, weight: isCompleted ? .medium : .regular))
                .foregroundColor(.white)
                .strikethrough(isCompleted)
            
            Spacer()
        }
    }
}

#Preview {
    WaterView()
} 