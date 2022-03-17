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
        NavigationLink(destination: Text("Nurses"), label: {
            VStack{
                Group{
                    Text(nurse.firstName).bold().font(.system(size: 22))
                        .foregroundColor(Color.black) +
                    Text(nurse.lastName).bold().font(.system(size: 22))
                        .foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.horizontal)
                HStack{
                    Text("email: ")
                        .font(.system(size: 18))
                    Text("\(nurse.email)")
                        .font(.system(size: 18))
                }
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 0.3)
                
                HStack{
                    Text("Age: ")
                        .font(.system(size: 18))
                    Text("\(nurse.age)")
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
        NurseCard(nurse: Nurse(id: "uuuhjs", firstName: "natalman", lastName: "Nahm", email: "natalnahm@gmail.com", age: 77))
    }
}
