//
//  NurseListView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI

struct NurseListView: View {
    
    @State var nurse = [
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
        Nurse(id: 22, name: "Jay Doe", completedTask: 3, uncompletedTask: 5),
    ]
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 0){
                    ForEach(self.nurse.indices, id: \.self) {index in
                        NurseCard(nurse: nurse[index])
                    }
                }
            }
            .navigationTitle("Nurse List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NurseListView_Previews: PreviewProvider {
    static var previews: some View {
        NurseListView()
    }
}
