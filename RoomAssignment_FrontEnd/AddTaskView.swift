//
//  TaskDetailView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import SwiftUI

struct AddTaskView: View {
    @State var timeToComplete: String = ""
    @State var roomNumber: String = ""
    @State var title: String = ""
    @State var isCompleted = false
    @State var task = Task(id: "", title: "", timeToComplete: 0.0, roomNumber: 1, isCompleted: false)
    @Binding var showingSheet: Bool
    var body: some View {
        NavigationView{
            VStack{
                TextField("Title:", text: self.$title)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top, 55)
                
                TextField("Time to Complete Task:", text: self.$timeToComplete)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top)
                
                TextField("Room Number:", text: self.$roomNumber)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top)
                
                Button(action:
                    {
                        //1. Save state
                    self.isCompleted.toggle()
                    print(isCompleted)
                }) {
                    HStack(alignment: .center, spacing: 10) {
                                    Image(systemName: self.isCompleted ? "checkmark.square" : "square")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    Text("Is Task Completed?")
                                        .font(Font.system(size: 14))
                                    Spacer()
                    }.foregroundColor(.red)
                }
                .padding(.vertical)
                .foregroundColor(Color.white)
                
//                Text("Description")
//                    .foregroundColor(Color.teal)
//                    .font(.system(size: 24))
                
//                if #available(iOS 14.0, *) {
//                    CustomTextEditor.init(placeholder: "Task Description...", text: $description)
//                        .frame(width: .infinity, height: 300)
//                        .background(Color(UIColor.systemGray6))
//                        .accentColor(.green)
//                        .cornerRadius(8)
//                        .padding(.bottom)
//                }
                
                Button(action: {
                    if(!title.isEmpty && !roomNumber.isEmpty && !timeToComplete.isEmpty){
                        ApiCall.AddTask(title: title, ttc: Float(timeToComplete)!, roomNumber: Int(roomNumber)!, isCompleted: isCompleted)
                    }
                    showingSheet.toggle()
                }) {
                  Text("Add Task")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("Task Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct UpdateTaskView: View {
    @State var timeToComplete: String = ""
    @State var roomNumber: String = ""
    @State var title: String = ""
    @State var isCompleted = false
    @State var task: Task
    @Binding var showingSheet: Bool
    var body: some View {
        NavigationView{
            VStack{
                TextField("Title:", text: self.$title)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top, 55)
                
                TextField("Time to Complete Task:", text: self.$timeToComplete)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top)
                
                TextField("Room Number:", text: self.$roomNumber)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top)
                
                Button(action:
                    {
                        //1. Save state
                    self.isCompleted.toggle()
                    print(isCompleted)
                }) {
                    HStack(alignment: .center, spacing: 10) {
                                    Image(systemName: self.isCompleted ? "checkmark.square" : "square")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    Text("Is Task Completed?")
                                        .font(Font.system(size: 14))
                                    Spacer()
                    }.foregroundColor(.red)
                }
                .padding(.vertical)
                .foregroundColor(Color.white)
                
                .onAppear(perform: {
                    self.title = task.title
                    self.isCompleted = task.isCompleted
                    self.roomNumber = String(task.roomNumber)
                    self.timeToComplete = String(format: "%.1f", task.timeToComplete)
                })
                
//                Text("Description")
//                    .foregroundColor(Color.teal)
//                    .font(.system(size: 24))
                
//                if #available(iOS 14.0, *) {
//                    CustomTextEditor.init(placeholder: "Task Description...", text: $description)
//                        .frame(width: .infinity, height: 300)
//                        .background(Color(UIColor.systemGray6))
//                        .accentColor(.green)
//                        .cornerRadius(8)
//                        .padding(.bottom)
//                }
                
                Button(action: {
                    if(!title.isEmpty && !roomNumber.isEmpty && !timeToComplete.isEmpty){
                        ApiCall.updateTask(title: title, ttc: Float(timeToComplete)!, roomNumber: Int(roomNumber)!, isCompleted: isCompleted)
                    }
                    showingSheet.toggle()
                }) {
                  Text("Add Task")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("Task Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct TaskDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView(showingSheet: false)
//    }
//}

@available(iOS 14.0, *)
struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty  {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
            }
            TextEditor(text: $text)
                .padding(internalPadding)
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}
