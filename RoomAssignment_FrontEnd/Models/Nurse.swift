//
//  Nurse.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import Foundation
import SwiftUI

class Nurse: Identifiable, ObservableObject{
    @Published var id: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var age: Int
    
    init(id: String, firstName: String, lastName: String, email: String, age: Int){
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.email = email
        self.age = age
    }
}
