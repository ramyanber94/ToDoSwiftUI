//
//  ToDoHeader.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct ToDoHeader: View {
    
    var sf: ScaleFactor
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("ToDos")
                        .font(.system(size: 35))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Button {
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .frame(width: sf.w * 0.2, height: sf.h * 0.15)
                            .foregroundColor(Color.white)
                    }
                }
                Text("Lorem ipsum dolor sit amet.")
                    .font(.system(size: 15))
                    .lineLimit(nil)
                    .foregroundColor(Color.white)
                    .opacity(0.5)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.background(Color("AccentColor"))
        }
    }
}

