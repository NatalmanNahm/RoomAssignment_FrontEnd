//
//  TaskDetailView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import SwiftUI

struct AddTaskView: View {
    @State var description: String = ""
    @State var title: String = ""
    var body: some View {
        NavigationView{
            VStack{
                TextField("Title:", text: self.$title)
                    .padding(.all, 10)
                    .background(Color(UIColor.systemGray6))
                    .accentColor(.green)
                    .cornerRadius(10.0)
                    .padding(.top, 55)
                
                Text("Description")
                    .foregroundColor(Color.teal)
                    .font(.system(size: 24))
                
                if #available(iOS 14.0, *) {
                    CustomTextEditor.init(placeholder: "Task Description...", text: $description)
                        .frame(width: .infinity, height: 300)
                        .background(Color(UIColor.systemGray6))
                        .accentColor(.green)
                        .cornerRadius(8)
                        .padding(.bottom)
                }
                
                Button(action: {
                    
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

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

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
