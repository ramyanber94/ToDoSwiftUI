//
//  ToDoCards.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct CustomCards: View {
    
    var roundedCornes: CGFloat?
    var startColor: Color?
    var endColor: Color?
    var cardName: String?
    var number: Binding<String>?
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: roundedCornes ?? 0)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [startColor ?? Color.white, endColor ?? Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                ).overlay(content: {
                    VStack{
                        HStack{
                            Image(image ?? "").foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding()
                            Text(number?.wrappedValue != "" ? number!.wrappedValue : "0").bold().foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding()
                        }
                        Text(cardName ?? "").bold().foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            .padding()
                    }
                 
                })
                .frame(width: width ?? 0, height: height ?? 0)
        }
    }
}

