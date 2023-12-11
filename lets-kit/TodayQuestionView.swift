//
//  TodayQuestionView.swift
//  lets-kit
//
//  Created by Jingbo Su on 12/10/23.
//

import SwiftUI

struct TodayQuestionView: View {
  @State private var userResponse: String = ""
  @State private var showingImagePicker: Bool = false
  @State private var inputImage: UIImage?
  @State private var blurResponses: Bool = true
  @State private var responses: [Response] = [
    Response(id: UUID(), name: "Jay", text: "I am content with my life's current state, feeling grateful for my achievements and relationships. However, I'd like to improve my work-life balance for better personal wellbeing.", image: nil, avatar: "Jay"),
    Response(id: UUID(), name: "Bob", text: "Generally, I'm happy, especially with my career progress and social connections. Yet, I aspire to travel more and explore different cultures, which I believe would enrich my life", image: nil, avatar: "Bob"),
    Response(id: UUID(), name: "Ibraheem", text: "Yes, I'm happy, especially with recent personal and professional milestones. But, I'd change my approach to health, incorporating more exercise and mindfulness practices into my daily routine.", image: nil, avatar: "Ibraheem"),
  ]
  
  var body: some View {
    VStack {
      TodayQuestionCard(
        question: "Are you truly happy with where you are in your life right now? What would you change?",
        askedBy: "Alex",
        responseRate: 0.6
      )
      
      ScrollView {
        ForEach(responses) { response in
          ResponseView(response: response, isBlurred: blurResponses)
        }
      }
      
      HStack {
        TextField("Your response", text: $userResponse)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button(action: {
          showingImagePicker = true
        }) {
          Image(systemName: "photo")
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
          ImagePicker(image: self.$inputImage)
        }
        
        Button("Send") {
          guard !userResponse.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
          let newResponse = Response(id: UUID(), name: "You", text: userResponse, image: inputImage, avatar: "Sonia")
          responses.append(newResponse)
          userResponse = ""
          inputImage = nil
          blurResponses = false
        }
        .disabled(userResponse.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
      }.padding()
      
    }
  }
  
  func loadImage() {
    guard let inputImage = inputImage else { return }
  }
}

struct TodayQuestionCard: View {
  let question: String
  let askedBy: String
  let responseRate: CGFloat
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(question)
        .font(.title3)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding()
        .background(Color.green)
        .cornerRadius(10)
        .padding()
      
      HStack {
        Text("Asked by: \(askedBy)")
          .font(.subheadline)
          .foregroundColor(.secondary)
        
        Spacer()
        
        // Add "Response Rate" text here
        Text("Response Rate")
          .font(.subheadline)
          .foregroundColor(.gray)
        
        ZStack {
          Circle()
            .stroke(lineWidth: 5.0)
            .opacity(0.3)
            .foregroundColor(Color.blue)
          
          Circle()
            .trim(from: 0.0, to: responseRate)
            .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
            .opacity(9)
            .foregroundColor(Color.orange)
            .rotationEffect(Angle(degrees: 270.0))
            .animation(.linear, value: responseRate)
          
          Text("\(Int(responseRate * 100))%")
            .font(.caption)
            .foregroundColor(Color.black)
        }
        .frame(width: 35, height: 35)
      }
      .padding([.leading, .bottom, .trailing])
    }
    .padding()
  }
}

struct ResponseView: View {
  let response: Response
  let isBlurred: Bool
  
  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      Image(response.avatar)
        .resizable()
        .scaledToFill()
        .frame(width: 50, height: 50)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
      
      VStack(alignment: .leading, spacing: 5) {
        Text(response.name)
          .fontWeight(.bold)
        
        Text(response.text)
          .lineLimit(nil)
          .fixedSize(horizontal: false, vertical: true)
      }
      .padding(.leading, 8)
    }
    .padding()
    .frame(width: UIScreen.main.bounds.width - 40)
    .background(Color.white)
    .cornerRadius(10)
    .shadow(radius: 1)
    .blur(radius: isBlurred ? 20 : 0)
    .padding(.horizontal)
    .animation(.easeInOut, value: isBlurred)
  }
}

struct Response: Identifiable {
  let id: UUID
  var name: String
  var text: String
  var image: UIImage?
  var avatar: String
}


#Preview {
  TodayQuestionView()
}
