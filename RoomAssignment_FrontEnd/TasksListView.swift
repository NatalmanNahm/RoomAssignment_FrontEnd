//
//  TasksListView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import SwiftUI

struct TasksListView: View {
    
    @State var task = [
        Task(id: 1, title: "New Task", description: "It's just a task"),
        Task(id: 2, title: "New Task", description: "It's just a task"),
        Task(id: 3, title: "New Task", description: "It's just a task"),
        Task(id: 4, title: "New Task", description: "It's just a task"),
        Task(id: 5, title: "New Task", description: "It's just a task")
    ]
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 0){
                    ForEach(self.task.indices, id: \.self) {index in
                        TaskCard(task: task[index])
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView()
    }
}
