//
//  ToDoView.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct ToDoView: View {
    
    @EnvironmentObject var user : UserController
    let sf = ScaleFactor()
    @State private var workNumbers = ""
    @State private var familyNumbers = ""
    @State private var urgentNumbers = ""
    @State private var isAddTask = false
    
    var body: some View {
        ZStack{
            Color("AccentColor").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                VStack{
                    ToDoHeader(sf: sf)
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            CustomCards(roundedCornes: 35, startColor: Color("workStart"), endColor: Color("workEnd"), cardName: "Work", number: $workNumbers, image: "work", width: sf.w * 0.4, height: sf.h * 0.15)
                            CustomCards(roundedCornes: 35, startColor: Color("familyStart"), endColor: Color("familyEnd"), cardName: "family", number: $familyNumbers, image: "family", width: sf.w * 0.4, height: sf.h * 0.15)
                            CustomCards(roundedCornes: 35, startColor: Color("urgentStart"), endColor: Color("urgentEnd"), cardName: "Urgent", number: $urgentNumbers, image: "urgent", width: sf.w * 0.4, height: sf.h * 0.15)
                        }
                    }
                    List {
                        if let todos = user.member.todos {
                            ForEach(todos){ todo in
                                CustomList(sectionFontSize: 20, sectionFontCol: Color.white, sectionBackgroundCol: Color.black, circleStartCol: Color.blue, circleEndCol: Color.yellow, circleHeigh: 20, circleWidth: 20, textCol: Color.white, textFontSize: 20, listBackGroundCol: Color.black, todos: todo).GenerateSection()
                            }
                        }
                    }
                }
                CustomButton(text: "+", fontSize: sf.w * 0.08, hTextPadding: 20, background: Color("button"), height: sf.h * 0.1, width: sf.w * 0.2, radius: 40, x: sf.w * 0.8, y: sf.h * 0.4) {
                    isAddTask.toggle()
                }
            }
      
        }.fullScreenCover(isPresented: $isAddTask) {
            AddNewToDoView()
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
