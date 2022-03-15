//
//  NureDetailView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct NureDetailView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var task = [
        Task(id: 1, title: "New Task", description: "It's just a task"),
        Task(id: 2, title: "New Task", description: "It's just a task"),
        Task(id: 3, title: "New Task", description: "It's just a task"),
        Task(id: 4, title: "New Task", description: "It's just a task"),
        Task(id: 5, title: "New Task", description: "It's just a task")
    ]
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Group{
                Text(name)
                    .padding(.top, 55)
                Text(phoneNumber)
                Text(email)
            }
            LazyVStack(alignment: .leading, spacing: 0){
                ForEach(self.task.indices, id: \.self) {index in
                    JustTaskCard(task: task[index])
                }
            }
            
            Button(action: {
                
            }) {
              Text("Assign New Task")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding(.top, 35)
            
        }
    }
}

struct NureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NureDetailView(name: "That Lady", phoneNumber: "6512265240", email: "thatlady@gmail.com")
    }
}
