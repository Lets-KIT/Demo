//
//  MyFriendGroupsView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct MyFriendGroupsView: View {
  // Example friend group data
  let friendGroups = [
    FriendGroup(name: "KIT group", description: "Startup", imageName: "kitGroup"),
    FriendGroup(name: "UCR Alumni", description: "University", imageName: "ucRiverside"),
    FriendGroup(name: "Inter Miami", description: "Soccer Team", imageName: "interMiami")
  ]
  
  var body: some View {
    VStack {
      HStack(spacing: 20) {
        Text("My Groups")
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
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(friendGroups, id: \.self) { group in
            VStack {
              Image(group.imageName)
                .resizable()
              //                .scaledToFit()
                .frame(width: 130, height: 110)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
              
              Text(group.name)
                .font(.headline)
              
              Text(group.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .frame(width: 120)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct FriendGroup: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let description: String
  let imageName: String
}

// Placeholder view for the friend groups detail page
struct FriendGroupsDetailView: View {
  var body: some View {
    Text("Friend Groups Detail View")
    // Customize this view to show detailed friend groups information
  }
}


#Preview {
  MyFriendGroupsView()
}
