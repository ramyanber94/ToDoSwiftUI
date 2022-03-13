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
    @State private var isFinished = false

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
                                HStack{
                                        Button {
                                            isFinished.toggle()
                                        } label: {
                                            
                                            if isFinished {
                                                ZStack{
                                                       Circle()
                                                           .fill(
                                                            LinearGradient(gradient: Gradient(colors: [Color(todo.color[0]) , Color(todo.color[1]) ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                                           )
                                                           .frame(width: sf.w * 0.1, height: sf.h * 0.05, alignment: .leading)
                                                   }.overlay {
                                                       Image(systemName: "checkmark").foregroundColor(Color.white)
                                                }
                                            }else {
                                                Circle()
                                                    .stroke(LinearGradient(colors: [Color(todo.color[0]) , Color(todo.color[0]) ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                                                    .frame(width: sf.w * 0.1, height: sf.h * 0.05, alignment: .leading)
                                            }
                                    
                                        }
                                    Text(todo.task).font(.custom("Gill Sans", fixedSize: sf.w * 0.06)).foregroundColor(.white) .strikethrough(isFinished)
                                    
                                }
                            }
                        }
                    }.frame(width: sf.w * 1, height: sf.h * 1, alignment: .center)
                    .onAppear() {
                                   UITableView.appearance().backgroundColor = UIColor.clear
                                   UITableViewCell.appearance().backgroundColor = UIColor.clear
                               }
                    .overlay {
                        CustomButton(text: "+", fontSize: sf.w * 0.08, hTextPadding: 20, background: Color("button"), height: sf.h * 0.07, width: sf.w * 0.15, radius: 40, x: sf.w * 0.8, y: sf.h * 0.45) {
                            isAddTask.toggle()
                        }
                    }
              
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
