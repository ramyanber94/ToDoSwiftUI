//
//  MenuSelector.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct DropDownSelector: View {
    
    var text: Binding<String>?
    var textSize: CGFloat?
    var circleStartCol: Color?
    var circleEndCol: Color?
    var circleWidth: CGFloat?
    var circleHeight: CGFloat?
    var frameStartCol: Color?
    var frameEndCol: Color?
    
    var body: some View {
        Menu {
            Button {
                text?.wrappedValue = "Family"
             } label: {
                 Text("Family")
             }
            Button {
                text?.wrappedValue = "Work"
             } label: {
                 Text("Work")
             }
            Button {
                text?.wrappedValue = "Urgent"
             } label: {
                 Text("Urgent")
             }
        }label: {
            Circle().fill(
                LinearGradient(gradient: Gradient(colors: [circleStartCol ?? Color("workStart"),circleEndCol ?? Color("workEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                ).frame(width: circleWidth ?? 20, height: circleHeight ?? 20)
                .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
                .padding(5)
            Text(text?.wrappedValue ?? "Work")
                .font(.system(size: textSize ?? 20))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
             Image(systemName: "arrowtriangle.forward.fill")
        }.modifier(LinearStyle(roundedCornes: 10, startColor: frameStartCol ?? Color("AccentColor"), endColor: frameEndCol ?? Color("textfield-end"), textColor: .white))
    }
}

