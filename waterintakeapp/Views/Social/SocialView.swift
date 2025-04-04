//
//  SocialView.swift
//  waterintakeapp
//
//  Created by Matin Rahimi on 2025-04-04.
//

import SwiftUI

struct SocialView: View {
    var body: some View {
        VStack {
            Text("Social")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "person.3.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                .foregroundColor(.green)
            
            Text("Connect with friends")
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SocialView()
} 