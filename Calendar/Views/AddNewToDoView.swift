//
//  AddNewToDoView.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI
import PickEmoji
import HalfModal

struct AddNewToDoView: View {

    @EnvironmentObject var user : UserController
    @Environment(\.presentationMode) var presentationMode
    @State var reminderText = ""
    @State var section = "Work"
    @State var date = Date()
    @State var time = Date()
    @State var notes = ""
    @State var isPickEmoji = false
    @State var isDate = false
    @State var isTime = false
    @State var dropdownText = "Work"
    @State var alertShow = false
    let sf = ScaleFactor()
    
    var body: some View {
            ZStack{
                Color("AccentColor").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        HStack{
                            CustomHeader(firstText: "New Reminder", firstTextLenght: sf.h * 0.01, firstTextX: sf.w * 0.25, firstTextY: sf.h * 0.04, firstTextMaxWidth: sf.w * 0.9, firstTextFontSize: sf.w * 0.07 ).GenerateHeaderText()
                            CustomHeader(btnTrailingImageName: "xmark.circle.fill", btnTrailingWidth: sf.w * 0.2, btnTrailingHeight: sf.h * 0.01, btnTrailingCol: Color.white, btnAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, btnTrailingX: sf.w * 0.4, btnTrailingY: sf.h * 0.04, btnTrailingSize: sf.w * 0.1).GenerateButtonTrailing()
                        }
                        Section(header: Text("Reminder Name").foregroundColor(Color.white).font(.system(size: sf.w * 0.03).bold()).frame(maxWidth: .infinity, alignment: .leading).padding(sf.h * 0.01)) {
                            TextField("", text: $reminderText).modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                                .position(x: sf.w * 0.5, y: sf.h * 0.04)
                        }
                        Section(header: Text("Category").foregroundColor(Color.white).font(.system(size: sf.w * 0.03).bold()).frame(maxWidth: .infinity, alignment: .leading).padding(sf.h * 0.02)) {
                            if dropdownText == "Urgent"{
                                DropDownSelector(text: $dropdownText, textSize: sf.w * 0.05, circleStartCol: Color("urgentStart"), circleEndCol: Color("urgentEnd"), circleWidth: sf.w * 0.09, circleHeight: sf.h * 0.04, frameStartCol: Color("textfield-end"), frameEndCol: Color("button")).frame(width: sf.w * 0.8, height: sf.h * 0.07)
                            }
                            else if dropdownText == "Family"{
                                DropDownSelector(text: $dropdownText, textSize: sf.w * 0.05, circleStartCol: Color("familyEnd"), circleEndCol: Color("familyStart"), circleWidth: sf.w * 0.09, circleHeight: sf.h * 0.04, frameStartCol: Color("textfield-end"), frameEndCol: Color("button")).frame(width: sf.w * 0.8, height: sf.h * 0.07)
                            }
                            else {
                                DropDownSelector(text: $dropdownText, textSize: sf.w * 0.05, circleStartCol: Color("workStart"), circleEndCol: Color("workEnd"), circleWidth: sf.w * 0.09, circleHeight: sf.h * 0.04, frameStartCol: Color("textfield-end"), frameEndCol: Color("button")).frame(width: sf.w * 0.8, height: sf.h * 0.07)
                            }
                           
                        }
                        Section(header: Text("Date And Time").foregroundColor(Color.white).font(.system(size: sf.w * 0.03).bold()).frame(maxWidth: .infinity, alignment: .leading).padding(sf.h * 0.02)) {
                                DatePicker("", selection: $date, displayedComponents: .date).frame(width: sf.w * 0.22, height: sf.h * 0, alignment: .center)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white))
                                DatePicker("", selection: $date, displayedComponents: .hourAndMinute).frame(width: sf.w * 0.17, height: sf.h * 0, alignment: .center)
                                    .modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white))
                                    .datePickerStyle(CompactDatePickerStyle())
                        }.frame(width: sf.w * 1, height: sf.h * 0.04, alignment: .center)
                        Section(header: Text("Note").foregroundColor(Color.white).font(.system(size: sf.w * 0.03).bold()).frame(maxWidth: .infinity, alignment: .leading).padding(sf.h * 0.03)) {
                            TextEditor(text: $notes).background(Color.white)
                                .foregroundColor(self.notes == "Put your notes here" ? .gray : .white)
                                .modifier(LinearStyle(roundedCornes: 20, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: Color.white, fontSize: 12))
                                .frame(width: sf.w * 1, height: sf.h * 0.15, alignment: .center)
                                .onTapGesture {
                                   if self.notes == "Put your notes here" {
                                     self.notes = ""
                                   }
                                }
                               
                        }.position(x: sf.w * 0.5, y: sf.h * 0.02)
                        Section(header: Text("Add smiley").foregroundColor(Color.white).font(.system(size: sf.w * 0.03).bold()).frame(maxWidth: .infinity, alignment: .leading).padding(sf.h * 0.03)) {
                            HStack{
                                CustomButton(text: "😄", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("AddSmily"), height: sf.h * 0.07, width: sf.w * 0.16, radius: 50, x: sf.w * 0.09, y: sf.h * 0.03) {
                                    notes += "😄"
                                }
                                CustomButton(text: "😁", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("AddSmily"), height: sf.h * 0.07, width: sf.w * 0.16, radius: 50, x: sf.w * 0.09, y: sf.h * 0.03) {
                                    notes += "😁"
                                }
                                CustomButton(text: "😍", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("AddSmily"), height: sf.h * 0.07, width: sf.w * 0.16, radius: 50, x: sf.w * 0.1, y: sf.h * 0.03) {
                                    notes += "😍"
                                }
                                CustomButton(text: "🥰", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("AddSmily"), height: sf.h * 0.07, width: sf.w * 0.16, radius: 50, x: sf.w * 0.1, y: sf.h * 0.03) {
                                    notes += "🥰"
                                }
                                CustomButton(text: "+", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("AddSmily"), height: sf.h * 0.07, width: sf.w * 0.16, radius: 50, x: sf.w * 0.1, y: sf.h * 0.03) {
                                    withAnimation {
                                                 isPickEmoji = true
                                             }
                                }
                            }.frame(width: sf.w * 1, height: sf.h * 0.06)
                                .position(x: sf.w * 0.5, y: sf.h * 0.02)
                        }.position(x: sf.w * 0.5, y: sf.h * 0.02)
                        CustomButton(text: "Create Reminder", fontSize: sf.w * 0.05, hTextPadding: 20, background: Color("button"), height: sf.h * 0.07, width: sf.w * 0.8, radius: 50, x: sf.w * 0.5, y: sf.h * 0.03) {
                            if notes == "Urgent"{
                                let check = user.addTodo(section: section , taskList: reminderText, status: "S", date: date, email: user.member.email!, notes: notes, color: ["urgentStart", "urgentEnd"])
                                if check {
                                    alertShow = true
                                }
                                print(user.member)
                            }
                            else if notes == "Family"{
                                let check = user.addTodo(section: section , taskList: reminderText, status: "S", date: date, email: user.member.email!, notes: notes, color: ["familyStart", "familyEnd"])
                                if check {
                                    alertShow = true
                                }
                                print(user.member)
                            }
                            else {
                                let check = user.addTodo(section: section , taskList: reminderText, status: "S", date: date, email: user.member.email!, notes: notes, color: ["workStart", "workEnd"])
                                if check {
                                    alertShow = true
                                }
                                print(user.member)
                            }
                        }
                    }.onTapGesture {
                        self.endEditing()
                    }.ignoresSafeArea(.keyboard)
                        .frame(minHeight: sf.h * 0.4, alignment: .topLeading)
           
                }.alert(isPresented: $alertShow) {
                    return Alert(title: Text("Success" as String))
                }
                if isPickEmoji {
                    HalfModalView(content: AnyView(PickAnyEmoji()) , header: AnyView(Text("Pick your emoji")), isPresented: $isPickEmoji)
                }
     
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },label: {
                        VStack{
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 15).weight(.heavy))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("New Reminder").foregroundColor(Color.white).font(.title3)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    })
                }
            }
    }
    private func endEditing() {
          UIApplication.shared.endEditing()
    }
}

struct AddNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewToDoView()
    }
}
