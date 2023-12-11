//
//  HomeView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          // Display totay questions
          DailyQuestionView()
            .padding(.top, 5.0)
          
          // Display previously asked questions
          DailyQuestionRecapView()
          
          // Group savings information
          MySavingsView()
          
          // Access to friend groups and settings
          MyFriendGroupsView()
            .padding(.top, 14.0)
        }
      }
      .navigationBarTitle("Home", displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: {
          // Handle settings action here
        }) {
          Image(systemName: "magnifyingglass")
        },
        trailing: Button(action: {
          // Handle notification action here
        }) {
          Image(systemName: "bell")
        }
      )
    }
  }
}

#Preview {
  HomeView()
}
