//
//  AssignTaskView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct AssignTaskView: View {
    @State private var selection = "Task 1"
    @State var roomNumber: String = ""
    let task = ["Task 1", "Task 2", "Task 3"]
    var body: some View {
        
        VStack {
            
            TextField("Room Number:", text: self.$roomNumber)
                .padding(.all, 10)
                .background(Color(UIColor.systemGray6))
                .accentColor(.green)
                .cornerRadius(10.0)
                .padding(.top, 100)
                .padding()
            
            Picker("choose a Task", selection: $selection) {
                ForEach(task, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .padding()

            Text("Selected Task: \(selection)")
            
            Button(action: {
                print(selection)
            }) {
              Text("Assign Task")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            Spacer()
        }
    }
}

struct AssignTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AssignTaskView()
    }
}
