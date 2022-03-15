//
//  Tasks.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import Foundation
import SwiftUI

class Task: Identifiable, ObservableObject{
    @Published var id: Int
    @Published var title: String
    @Published var description: String
    
    init(id: Int, title: String, description: String){
        self.id = id
        self.title = title
        self.description = description
    }
}

class Tasks: ObservableObject{
    @Published var Tasks: [Task] = [Task]()
}
