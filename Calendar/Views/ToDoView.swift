//
//  ToDoView.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct ToDoView: View {
    
    let sf = ScaleFactor()
    @State private var numbers = ""
    @State private var isAddTask = false
    
    var body: some View {
        ZStack{
            Color("AccentColor").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                VStack{
                    ToDoHeader(sf: sf)
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ToDoCards(sf: sf, roundedCornes: 40, startColor: Color("workStart"), endColor: Color("workEnd"), cardName: "Work", number: $numbers, image: "work")
                            ToDoCards(sf: sf, roundedCornes: 40, startColor: Color("familyStart"), endColor: Color("familyEnd"), cardName: "family", number: $numbers, image: "family")
                            ToDoCards(sf: sf, roundedCornes: 40, startColor: Color("urgentStart"), endColor: Color("urgentEnd"), cardName: "Urgent", number: $numbers, image: "urgent")
                        }
                    }
                }
            }
            Button {
                isAddTask.toggle()
            } label: {
                Text("+").foregroundColor(.white)
            }
//            }.modifier(LinearStyle(roundedCornes: <#T##CGFloat?#>, startColor: <#T##Color?#>, endColor: <#T##Color?#>, textColor: <#T##Color?#>, lineWidth: <#T##Double?#>, shadowRadius: <#T##Double?#>, fontSize: <#T##CGFloat?#>, color: <#T##String?#>, text: <#T##String?#>))
                .frame(maxWidth: sf.w * 0.2, alignment: .leading)
                    .padding()

        }.fullScreenCover(isPresented: $isAddTask) {
            
        }
    }
    @ViewBuilder
    func createSections(startColor: Color, endColor: Color, isClicked: Binding<Bool>, sf: ScaleFactor, text: String)-> some View {
       Section(header: Text("Important tasks")) {
           ToDoItem(startColor: startColor, endColor: endColor, isClicked: isClicked, sf: sf, text: text)
       }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
