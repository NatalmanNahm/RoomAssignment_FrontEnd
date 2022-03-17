//
//  ApiCall.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import Foundation
import Alamofire


class ApiCall{
    static let defaults = UserDefaults.standard
    static let baseUrl = "https://b9u0yq8uqh.execute-api.us-west-2.amazonaws.com/test"
    static func signUpUser(username: String, firstName: String, password: String, lastName: String, email: String, age: Int) -> String {
        print("Sending request")
        var requestResponse = ""
        let parameters: Parameters = [
            "username": username,
            "password": password,
            "fname": firstName,
            "lname": lastName,
            "email": email,
            "age": age
          ]
        AF.request("\(baseUrl)/signup", method: .post, parameters: parameters, encoding:
                    JSONEncoding.default).responseString{ response in
            if let json = response.value{
                print("code: \(json)")
            }

            requestResponse = "\(response)"
        }
        return requestResponse
    }
    
    static func logInUser(username: String, password: String) {
        print("Signing in...")
        let parameters: Parameters = ["username": username, "password": password]
        AF.request("\(baseUrl)/login", method: .post, parameters: parameters, encoding:
                    JSONEncoding.default).responseJSON {
            response in
            switch response.result {
               case .success(let value):
                   if let JSON = value as? [String: Any] {
                       let token = JSON["token"] as! String
                       print(token)
                       defaults.set(token, forKey: "token")
                       defaults.set(username, forKey: "username")
                       defaults.set(password, forKey: "password")
                   }
               case .failure(let error):
                   // error handling
                    print(error)
                    
               }
        }
    }
    
    static func AddTask(title: String, ttc: Float, roomNumber: Int, isCompleted: Bool) {
        let parameters: Parameters = [
            "taskname": title,
            "ttc": ttc,
            "room": roomNumber,
            "iscompleted": isCompleted
        ]
        AF.request("\(baseUrl)/item", method: .post, parameters: parameters, encoding:
                    JSONEncoding.default).responseJSON {
            response in
            if let json = response.value{
                print("code: \(json)")
            }
        }
    }
    
    
    static func updateTask(title: String, ttc: Float, roomNumber: Int, isCompleted: Bool) {
        let parameters: Parameters = [
            "taskname": title,
            "ttc": ttc,
            "room": roomNumber,
            "iscompleted": isCompleted
        ]
        AF.request("\(baseUrl)/item", method: .put, parameters: parameters, encoding:
                    JSONEncoding.default).responseJSON {
            response in
            if let json = response.value{
                print("code: \(json)")
            }
        }
    }
    
    static func updateUser(username: String, firstName: String, lastName: String, email: String, age: Int) {
        let parameters: Parameters = [
            "fname": firstName,
            "lname": lastName,
            "email": email,
            "age": age
          ]
        AF.request("\(baseUrl)/user/\(username)", method: .put, parameters: parameters, encoding:
                    JSONEncoding.default).responseJSON {
            response in
            if let json = response.value{
                print("code: \(json)")
            }
        }
    }
    
    
}

