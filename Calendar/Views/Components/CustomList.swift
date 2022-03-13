//
//  CustomList.swift
//  Calendar
//
//  Created by ramy on 2022-03-12.
//

import SwiftUI

struct CustomList: View {
    
    var sectionFontSize: CGFloat?
    var sectionFontCol: Color?
    var sectionBackgroundCol: Color?
    var circleStartCol: Color?
    var circleEndCol: Color?
    var circleHeigh: CGFloat?
    var circleWidth: CGFloat?
    var textCol: Color?
    var textFontSize: CGFloat?
    var listBackGroundCol: Color?
    var todos: ToDo?
    
    var body: some View {
        GenerateSection()
    }
    
   @ViewBuilder
    func GenerateSection()-> some View {
        if let todo = todos{
        Section(header: Text(todo.section ?? "Important tasks").font(.title2).font(.custom("Arial", fixedSize: sectionFontSize ?? 15)).foregroundColor(sectionFontCol ?? .black).background(sectionBackgroundCol ?? .white).padding(1)) {
                HStack{
                    if todo.status == "S"{
                        Circle()
                            .stroke(LinearGradient(colors: [circleStartCol ?? .white , circleEndCol ?? .black], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                            .frame(width: circleWidth ?? 30, height: circleHeigh ?? 25, alignment: .leading)
                    }else{
                        ZStack{
                               Circle()
                                   .fill(
                                    LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                   )
                                   .frame(width: circleWidth ?? 30, height: circleHeigh ?? 25, alignment: .leading)
                           }.overlay {
                               Image(systemName: "checkmark").foregroundColor(Color.white)
                        }
                    }
                    Text(todo.task ?? "dsads").font(.custom("Gill Sans", fixedSize: textFontSize ?? 20)).foregroundColor(textCol ?? .white)
                }
            }.listRowBackground(listBackGroundCol ?? Color.green)
        }
    }
}

struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        CustomList()
    }
}
