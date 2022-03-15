//
//  ProfileView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = "Natalman"
    @State var phoneNumber: String = "651299303"
    @State var email: String = "natalnam@gmail.com"
    @State var address: String = "something something"
    var body: some View {
        VStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 150, height: 150)
            Group{
                Text(name)
                Text(phoneNumber)
                Text(email)
            }
            TextField("Name", text: self.$name)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                .padding()
            
            TextField("Phone Number", text: self.$phoneNumber)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                .padding()
            
            TextField("Email", text: self.$email)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                .padding()
            
            TextField("address", text: self.$address)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                .padding()
            
            Button(action: {
                
            }) {
              Text("Save Change")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                
            }) {
              Text("Assigned Tasks")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding(.bottom, 10)

            Button(action: {
                
            }) {
              Text("List of Nurses")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
