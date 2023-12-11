//
//  DailyQuestionRecapView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct DailyQuestionRecapView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("My Question Recap")
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
          ForEach(questionRecaps, id: \.self) { question in
            QuestionCard(question: question)
          }
        }
        .padding()
      }
    }
  }
}

// Example of a QuestionCard view that corresponds to each card in the recap
struct QuestionCard: View {
  var question: QuestionRecap
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(question.content)
        .font(.headline)
        .foregroundColor(.white)
      
      Text("Asked by: \(question.askedBy)")
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.8))
      
      Text(question.group)
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.8))
    }
    .padding()
    .frame(width: 180, height: 150)
    .background(question.color)
    .cornerRadius(15)
  }
}

// The data model for the question recap cards
struct QuestionRecap: Identifiable, Hashable {
  let id = UUID()
  let content: String
  let askedBy: String
  let group: String
  let color: Color
}

// Example data for the recap cards
let questionRecaps = [
  QuestionRecap(content: "Do you think CS175 is an amazing class?", askedBy: "Sonia", group: "UCR Alumni", color: .purple),
  QuestionRecap(content: "Did you meet someone new this past week? How was it?", askedBy: "Jay", group: "KIT Group", color: .green),
  QuestionRecap(content: "What song have you related most to recently?", askedBy: "Bob", group: "China Boy", color: .pink),
  // Add more question cards here
]

#Preview {
  DailyQuestionRecapView()
}
