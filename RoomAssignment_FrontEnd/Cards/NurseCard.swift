//
//  NurseCard.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct NurseCard: View {
    @State var nurse: Nurse
    var body: some View {
        NavigationLink(destination: TaskDetail(), label: {
            VStack{
                Text(nurse.name)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                HStack{
                    Text("Completed Task: ")
                        .font(.system(size: 18))
                    Text("\(nurse.completedTask)")
                        .font(.system(size: 18))
                }
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 0.3)
                
                HStack{
                    Text("Uncompleted Task: ")
                        .font(.system(size: 18))
                    Text("\(nurse.completedTask)")
                        .font(.system(size: 18))
                }
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

struct NurseCard_Previews: PreviewProvider {
    static var previews: some View {
        NurseCard(nurse: Nurse(id: 23, name: "That lady", completedTask: 3, uncompletedTask: 7))
    }
}
