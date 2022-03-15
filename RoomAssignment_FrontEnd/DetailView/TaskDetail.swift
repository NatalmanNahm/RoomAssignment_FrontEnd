//
//  TaskDetail.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct TaskDetail: View {
    @State var taskTitle: String = ""
    @State var roomNumber: String = ""
    @State var taskDescription: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Title:")
                    .bold()
                Text(taskTitle)
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
                Text(roomNumber)
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Group{
                Text("Description: ")
                    .bold() +
                Text(taskDescription)
            }
            .padding(.all, 10)
            .background(Color(UIColor.systemGray6))
            .accentColor(.green)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 34)
            
            Button(action: {
                
            }) {
              Text("Assignment Finished")
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
        
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(taskTitle: "Make Bed", roomNumber: "255", taskDescription: "Make sure the bed is made. Add Pillow and clean sheet")
    }
}
