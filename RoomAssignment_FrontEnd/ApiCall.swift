//
//  ApiCall.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import Foundation
import Alamofire


class ApiCall{
    static func signUpUser(username: String, name: String, password: String, phoneNumber: String, email: String, address: String){
        print("Sending request")
        let parameters: Parameters = ["username": username, "password": password, "staffname": name, "phonenumber": phoneNumber, "email": email, "address": address]
        AF.request("http://127.0.0.1:5000/signup", method: .post, parameters: parameters).responseJSON { response in
            debugPrint("Response: \(response)")
        }
    }
}

