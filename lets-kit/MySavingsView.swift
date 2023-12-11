//
//  MySavingsView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct MySavingsView: View {
  // Example savings data
  let savingsAmount: CGFloat = 912
  let savingsGoal: CGFloat = 1200
  var savingsPercentage: CGFloat {
    return savingsAmount / savingsGoal
  }
  
  var body: some View {
    VStack {
      HStack {
        Text("My Savings")
          .font(.headline)
          .fontWeight(.bold)
        Spacer()
        NavigationLink(destination: SavingsDetailView()) {
          Text("See all")
            .font(.footnote)
            .foregroundColor(.purple.opacity(0.9))
        }
      }
      .padding(.horizontal)
      
      VStack(alignment: .leading) {
        Text("KIT Group’s savings progress")
          .font(.caption)
          .foregroundColor(.white)
          .padding(.top)
        
        HStack(spacing: 20) {
          Text("\(Int(savingsPercentage * 100))% to reach trip money")
            .font(.headline)
            .foregroundColor(.white)
          Spacer()
          Text("Goal: $\(Int(savingsGoal))")
            .font(.caption)
            .foregroundColor(.white.opacity(0.9))
        }
        .padding(.vertical, 2)
        
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 10)
            .frame(height: 20)
            .foregroundColor(.white.opacity(0.4))
          
          RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.main.bounds.width * savingsPercentage - 50, height: 20)
            .foregroundColor(.blue)
            .animation(.linear, value: savingsPercentage)
          
          Text("$\(Int(savingsAmount))")
            .font(.caption)
            .foregroundColor(.white)
            .frame(width: 50, height: 20)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.leading, UIScreen.main.bounds.width * savingsPercentage - 100)
            .animation(.linear, value: savingsAmount)
        }
      }
      .padding()
      .background(Color.blue.opacity(0.5))
      .cornerRadius(15)
      .shadow(radius: 5)
      .padding(.horizontal)
    }
  }
}

// Placeholder view for the savings detail page
struct SavingsDetailView: View {
  var body: some View {
    Text("Savings Detail View")
    // Customize this view to show detailed savings information
  }
}



#Preview {
  MySavingsView()
}
