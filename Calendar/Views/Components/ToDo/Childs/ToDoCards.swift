//
//  ToDoCards.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct ToDoCards: View {
    
    var sf : ScaleFactor
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var cardName: String
    var number: Binding<String>
    var image: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: roundedCornes)
                .fill(
                LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                ).overlay(content: {
                    VStack{
                        HStack{
                            Image(image).foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding()
                            Text(number.wrappedValue != "" ? number.wrappedValue : "0").bold().foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding()
                        }
                        Text(cardName).bold().foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            .padding()
                    }
                 
                })
                .frame(width: sf.w * 0.4, height: sf.h * 0.15)
        }
    }
}

