//
//  MenuSelector.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct MenuSelector: View {
    var text : Binding<String>?
    let sf = ScaleFactor()
    
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
                LinearGradient(gradient: Gradient(colors: [Color("workStart"), Color("workEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                ).frame(width: sf.w * 0.06, height: sf.h * 0.04)
                .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
                .padding(5)
            Text(text?.wrappedValue ?? "Work")
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
             Image(systemName: "arrowtriangle.forward.fill")
        }.modifier(LinearStyle(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
//            .frame(width: sf.w * 1, height: sf.h * 0.1)
    }
}

struct MenuSelector_Previews: PreviewProvider {
    static var previews: some View {
        MenuSelector()
    }
}
