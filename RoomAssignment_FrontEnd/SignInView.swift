//
//  SignInView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State private var showingProfileSheet = false
    @State private var showingSignUpSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("SIGN IN")
            .font(.title)
            .foregroundColor(Color.teal)
            .padding([.top, .bottom], 20)
            .frame(maxWidth: .infinity, alignment: .center)

            TextField("Username", text: self.$username)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
                    
            SecureField("Password", text: self.$password)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            Button(action: {
                DispatchQueue.main.async {
                    ApiCall.logInUser(username: username, password: password)
                }
                showingProfileSheet.toggle()
            }) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .fullScreenCover(isPresented: $showingProfileSheet, onDismiss: {}) {
                ProfileView(username: username)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Button(action: {
                showingSignUpSheet.toggle()
            }) {
              Text("Create Account")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .fullScreenCover(isPresented: $showingSignUpSheet, onDismiss: {}) {
              SignUpView()
            }
            
        }.padding([.leading, .trailing], 27.5)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
