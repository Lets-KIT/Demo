//
//  DailyQuestionView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct DailyQuestionView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("Answer your daily question!")
        .font(.title2)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .bold()
        .padding(.bottom, 17.0)
        .frame(maxWidth: .infinity)
      
      NavigationLink(destination: TodayQuestionView()) {
        Text("Respond")
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.red)
          .cornerRadius(30)
      }
      .padding(.horizontal, 50.0)
    }
    .padding()
    .background(Color.blue.opacity(0.2))
    .cornerRadius(10)
    .padding()
    
    // Rotating dots (fake)
    HStack {
      Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(.blue)
      Circle()
        .frame(width: 6, height: 6)
        .foregroundColor(.blue)
      Circle()
        .frame(width: 6, height: 6)
        .foregroundColor(.blue)
    }
    .padding(.top, -12.0)
  }
}


#Preview {
  DailyQuestionView()
}
