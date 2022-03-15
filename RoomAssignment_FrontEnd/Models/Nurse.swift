//
//  Nurse.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import Foundation
import SwiftUI

class Nurse: Identifiable, ObservableObject{
    @Published var id: Int
    @Published var name: String
    @Published var completedTask: Int
    @Published var uncompletedTask: Int
    
    init(id: Int, name: String, completedTask: Int, uncompletedTask: Int){
        self.id = id
        self.name = name
        self.completedTask = completedTask
        self.uncompletedTask = uncompletedTask
    }
}
