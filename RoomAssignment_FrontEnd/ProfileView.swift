//
//  ProfileView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import SwiftUI
import Alamofire

struct ProfileView: View {
    let defaults = UserDefaults.standard
    @State var firstName: String = "Natalman"
    @State var lastName: String = "651299303"
    @State var email: String = "natalnam@gmail.com"
    @State var address: String = "something something"
    @State var age: Int = 0
    @State var username: String = ""
    @State private var showingSheet = false
    @State private var showingSignInSheet = false
    @State private var action: Int?
    let baseUrl = "https://b9u0yq8uqh.execute-api.us-west-2.amazonaws.com/test"
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 150, height: 150)
                Group{
                    Text(firstName)
                    Text(lastName)
                    Text(email)
                    Text(String(age))
                }
                Button(action: {
                    self.showingSheet.toggle()
                }) {
                  Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
                .padding(.bottom, 10)
                .sheet(isPresented: $showingSheet, onDismiss: {

                }) {
                    NavigationView{
                        if username.isEmpty{
                            EditUser(userName: defaults.object(forKey: "username") as! String ,firstName: firstName, lastName: lastName, email: email, address: address, age: String(age), showingSheet: $showingSheet)
                        } else {
                            EditUser(userName: username ,firstName: firstName, lastName: lastName, email: email, address: address, age: String(age), showingSheet: $showingSheet)
                        }
                        
                    }
                }
                
                NavigationLink(destination: TasksListView(), tag: 1, selection: $action){
                   EmptyView()
               }
                
                Button(action: {
                    self.action = 1
                }) {
                  Text("All Tasks")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
                .padding(.bottom, 10)

                
                NavigationLink(destination: NurseListView(), tag: 2, selection: $action){
                   EmptyView()
               }
                Button(action: {
                    self.action = 2
                }) {
                  Text("List of Nurses")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }
                
                Button(action: {
                    ApiCall.logInUser(username: defaults.object(forKey: "username") as! String, password: defaults.object(forKey: "password") as! String)
//                    defaults.removeObject(forKey: "token")
//                    defaults.removeObject(forKey: "username")
//                    defaults.removeObject(forKey: "password")
                    showingSignInSheet.toggle()
                }) {
                  Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(15.0)
                }
                .fullScreenCover(isPresented: $showingSignInSheet, onDismiss: {}) {
                  SignInView()
                }
            }
            .onAppear(perform: {
                if username.isEmpty{
                    AF.request("\(baseUrl)/user/\(defaults.object(forKey: "username") as! String)", method: .get, encoding:
                                JSONEncoding.default).responseJSON {
                        response in
                        switch response.result {
                           case .success(let value):
                               if let JSON = value as? [[String: Any]] {
                                   for user in JSON{
                                       self.firstName = user["first_name"] as! String
                                       self.lastName = user["last_name"] as! String
                                       self.age = user["age"] as! Int
                                       self.email = user["email"] as! String
                                       print(user["first_name"] as! String)
                                   }
                               }
                           case .failure(let error):
                               // error handling
                                print(error)
                                
                           }
                    }
                }
                else{
                    AF.request("\(baseUrl)/user/\(username)", method: .get, encoding:
                                JSONEncoding.default).responseJSON {
                        response in
                        switch response.result {
                           case .success(let value):
                               if let JSON = value as? [[String: Any]] {
                                   for user in JSON{
                                       self.firstName = user["first_name"] as! String
                                       self.lastName = user["last_name"] as! String
                                       self.age = user["age"] as! Int
                                       self.email = user["email"] as! String
                                       print(user["first_name"] as! String)
                                   }
                               }
                           case .failure(let error):
                               // error handling
                                print(error)
                                
                           }
                    }
                }
                
            })
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
