//
//  ContentView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }
      TodayQuestionView()
        .tabItem {
          Image(systemName: "text.bubble")
          Text("Responses")
        }
      MySavingsView()
        .tabItem {
          Image(systemName: "dollarsign.arrow.circlepath")
          Text("Savings")
        }
      ProfileView()
        .tabItem {
          Image(systemName: "person.fill")
          Text("Profile")
        }
    }
  }
}

struct ProfileView: View {
  var body: some View {
    Text("Profile Page")
  }
}

#Preview {
  ContentView()
}
