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
        NavigationLink(destination: TaskDetail(task: task), label: {
            VStack{
                Text(task.title)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                Text("Room Number: \(task.roomNumber) ")
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Text("Time to Complete: \(String(format: "%.1f", task.timeToComplete)) hour ")
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Divider()
                    .background(Color.black)
                    .padding(.horizontal)
            }
        })
            .isDetailLink(false)
    }
}

//struct JustTaskCard: View {
//    @State var task: Task
//    var body: some View {
//        VStack{
//            Text(task.title)
//                .bold()
//                .font(.system(size: 22))
//                .foregroundColor(Color.black)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.vertical, 10)
//                .padding(.horizontal)
//            Text(task.description)
//                .font(.system(size: 18))
//                .foregroundColor(Color.black)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.horizontal)
//            Divider()
//                .background(Color.black)
//                .padding(.horizontal)
//        }
//    }
//}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard(task: Task(id: "674477", title: "Make Bed", timeToComplete: 3.5, roomNumber: 200, isCompleted: false))
    }
}
