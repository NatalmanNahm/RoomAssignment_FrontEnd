//
//  ApiCall.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import Foundation
import Alamofire


class ApiCall{
    static let baseUrl = "https://b9u0yq8uqh.execute-api.us-west-2.amazonaws.com/test"
    static func signUpUser(username: String, firstName: String, password: String, lastName: String, email: String) -> String {
        print("Sending request")
        var requestResponse = ""
        let parameters: Parameters = [
            "username": username,
            "password": password,
            "fname": firstName,
            "lname": lastName,
            "email": email
          ]
        AF.request("\(baseUrl)/signup", method: .post, parameters: parameters).responseJSON { response in
            debugPrint("Response: \(response)")
            requestResponse = "\(response)"
        }
        return requestResponse
    }
    
    static func logInUser(username: String, password: String) {
        print("Signing in...")
        let parameters: Parameters = ["username": username, "password": password]
        AF.request("\(baseUrl)/login", method: .post, parameters: parameters).responseJSON {
            response in
            debugPrint("Response: \(response)")
        }
    }
    
    static func something() {
        
    }
    
    
}

