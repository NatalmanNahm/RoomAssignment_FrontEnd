//
//  Tasks.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/13/22.
//

import Foundation
import SwiftUI

class Task: Identifiable, ObservableObject{
    @Published var id: String
    @Published var title: String
    @Published var timeToComplete: Float
    @Published var roomNumber: Int
    @Published var isCompleted: Bool
    
    init(id: String, title: String, timeToComplete: Float, roomNumber: Int, isCompleted: Bool){
        self.id = id
        self.title = title
        self.timeToComplete = timeToComplete
        self.roomNumber = roomNumber
        self.isCompleted = isCompleted
    }
}

class Tasks: ObservableObject{
    @Published var Tasks: [Task] = [Task]()
}
