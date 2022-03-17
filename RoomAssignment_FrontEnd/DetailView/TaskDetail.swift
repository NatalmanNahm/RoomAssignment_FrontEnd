//
//  TaskDetail.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct TaskDetail: View {
    @State var task: Task
    @State private var showingSheet = false
    var body: some View {
        VStack{
            HStack{
                Text("Title:")
                    .bold()
                Text(task.title)
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .padding(.top, 55)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text("Room:")
                    .bold()
                Text("\(task.roomNumber)")
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Group{
                Text("Time to Complete: ")
                    .bold() +
                Text(String(format: "%.1f", task.timeToComplete))
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text("Completed:")
                    .bold()
                Text(String(task.isCompleted))
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 34)
            
            Button(action: {
                self.showingSheet.toggle()
            }) {
              Text("Edit Task")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding(.bottom)
            .sheet(isPresented: $showingSheet, onDismiss: {

            }) {
                NavigationView{
                    UpdateTaskView(task: task, showingSheet: $showingSheet)
                }
            }
            
            Button(action: {
                
            }) {
              Text("Delete Task")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.red)
                .cornerRadius(15.0)
            }
            Spacer()
            
        }
        .padding()
        
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(task: Task(id: "674477", title: "Make Bed", timeToComplete: 3.5, roomNumber: 200, isCompleted: false))
    }
}
