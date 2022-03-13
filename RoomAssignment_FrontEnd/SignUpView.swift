//
//  SignUpView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var username: String = ""
    @State var address: String = ""
    @State private var showingProfileSheet = false
    @State private var showingSignInSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("SIGN UP")
                .font(.title)
                .foregroundColor(Color.teal)
                .padding([.top, .bottom], 20)
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("Email", text: self.$email)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            TextField("Full Name", text: self.$name)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            TextField("Username", text: self.$username)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                    
            SecureField("Password", text: self.$password)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            TextField("Phone Number", text: self.$phoneNumber)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            TextField("Address", text: self.$address)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            Button(action: {
                showingProfileSheet.toggle()
            }) {
              Text("Create Account")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .fullScreenCover(isPresented: $showingProfileSheet, onDismiss: {}) {
              ProfileView()
            }
            
            Button(action: {
                showingSignInSheet.toggle()
            }) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .fullScreenCover(isPresented: $showingSignInSheet, onDismiss: {}) {
              SignInView()
            }
            
        }.padding([.leading, .trailing], 27.5)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
