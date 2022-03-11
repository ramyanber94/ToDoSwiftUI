//
//  ToDoList.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct ToDoItem: View {
    
    var startColor: Color
    var endColor: Color
    var isClicked: Binding<Bool>
    var sf: ScaleFactor
    var text: String
    
    
    var body: some View {
        HStack{
            Button {
                isClicked.wrappedValue.toggle()
            } label: {
                if isClicked.wrappedValue{
                    Circle()
                        .strokeBorder(
                            LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing),
                         lineWidth: 4)
                        .frame(maxWidth: sf.w * 0.1, alignment: .leading)
                        .padding()
                }else{
                    ZStack{
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(maxWidth: sf.w * 0.1, alignment: .leading)
                            .padding()
                    }.overlay {
                        Image(systemName: "checkmark").foregroundColor(Color.white)
                    }
        
                }
            }
            Text(text).foregroundColor(Color.white)
                .frame(maxWidth: sf.w * 0.9, alignment: .leading)
                .padding()
        }
    }
}

