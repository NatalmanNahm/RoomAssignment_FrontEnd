//
//  TaskCard.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import SwiftUI

struct TaskCard: View {
    @State var task: Task
    var body: some View {
        NavigationLink(destination: TaskDetail(), label: {
            VStack{
                Text(task.title)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                Text(task.description)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Divider()
                    .background(Color.black)
                    .padding(.horizontal)
            }
        })
    }
}

struct JustTaskCard: View {
    @State var task: Task
    var body: some View {
        VStack{
            Text(task.title)
                .bold()
                .font(.system(size: 22))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.horizontal)
            Text(task.description)
                .font(.system(size: 18))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Divider()
                .background(Color.black)
                .padding(.horizontal)
        }
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard(task: Task(id: 1, title: "Make Bed", description: "Go to room 1 and make sure the bed is made."))
    }
}
