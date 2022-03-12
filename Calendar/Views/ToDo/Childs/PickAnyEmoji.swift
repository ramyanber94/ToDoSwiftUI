//
//  PickEmoji.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI
import PickEmoji

struct PickAnyEmoji: View {
    
    @State var selectedEmoji = "No Emoji"
    
    var body: some View {
        VStack {
          ScrollView(.vertical, showsIndicators: false) {
              PickEmoji(numberOfEmojiPerRow: 6) { emoji in
                  selectedEmoji = emoji
              }
          }
          .frame(maxHeight: 400)
          .cornerRadius(14)

          Spacer()

          HStack {
              Text("Selected Emoji: ")
              Text(selectedEmoji)
          }
          .foregroundColor(.black)
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .shadow(color: .black.opacity(0.4), radius: 12, x: 6, y: 6)
      }
      .padding()
    }
}


struct PickEmoji_Previews: PreviewProvider {
    static var previews: some View {
        PickAnyEmoji()
    }
}
