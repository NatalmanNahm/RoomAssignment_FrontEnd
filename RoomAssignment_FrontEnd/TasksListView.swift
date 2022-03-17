//
//  TasksListView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import SwiftUI
import Alamofire

struct TasksListView: View {
    private let baseUrl = "https://b9u0yq8uqh.execute-api.us-west-2.amazonaws.com/test"
    @State private var showingSheet = false
    @ObservedObject var task = Tasks()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 0){
                    ForEach(self.task.Tasks.indices, id: \.self) {index in
                        TaskCard(task: task.Tasks[index])
                    }
                }
                .onAppear(perform: {
                    print("hi")
                    if task.Tasks.isEmpty{
                        DispatchQueue.main.async {
                            AF.request("\(baseUrl)/item", method: .get, encoding:
                                        JSONEncoding.default).responseJSON{ response in
                                switch response.result {
                                   case .success(let value):
                                       if let JSON = value as? [[String: Any]] {
                                           for task in JSON{
                                               print("\(task["taskname"]!)")
                                               let aTask = Task(id: task["id"] as! String, title: task["taskname"] as! String, timeToComplete: task["ttc"] as! Float, roomNumber: task["room"] as! Int, isCompleted: task["iscompleted"] as! Bool)
                                               self.task.Tasks.append(aTask)
                                           }
                                       }
                                   case .failure(let error):
                                       // error handling
                                        print(error)
                                        
                                   }
                            }
                        }
                    }
                    
                    
                })
                
                Button(action: {
                    showingSheet.toggle()
                }) {
                  Text("Add Task")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .padding(.top)
                }
                .sheet(isPresented: $showingSheet, onDismiss: {

                }) {
                    NavigationView{
                        AddTaskView(showingSheet: $showingSheet)
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
