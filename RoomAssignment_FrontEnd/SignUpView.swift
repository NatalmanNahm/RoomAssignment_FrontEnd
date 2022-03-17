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
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var username: String = ""
    @State var age: String = ""
    @State var response: String = ""
    @State private var showingProfileSheet = false
    @State private var showingSignInSheet = false
    @State var checkState:Bool = false ;
    
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
            
            TextField("First Name", text: self.$firstName)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            
            TextField("Last Name", text: self.$lastName)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(10.0)
            TextField("Age", text: self.$age)
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
            
            Button(action: {
                DispatchQueue.main.async {
                    if(!email.isEmpty && !firstName.isEmpty && !lastName.isEmpty && !password.isEmpty && !username.isEmpty){
                        response = ApiCall.signUpUser(username: username, firstName: firstName, password: password, lastName: lastName, email: email, age: Int(age)!)
                    }
                }
                print("reponse: " + response)
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
            .frame(maxWidth: .infinity, alignment: .center)
            .fullScreenCover(isPresented: $showingProfileSheet, onDismiss: {}) {
              SignInView()
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
            .frame(maxWidth: .infinity, alignment: .center)
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
