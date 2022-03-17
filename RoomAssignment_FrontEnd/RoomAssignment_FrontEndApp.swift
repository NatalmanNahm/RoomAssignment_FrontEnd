//
//  RoomAssignment_FrontEndApp.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/12/22.
//

import SwiftUI

@main
struct RoomAssignment_FrontEndApp: App {
    let defaults = UserDefaults.standard
    
    var body: some Scene {
        WindowGroup {
            if ((defaults.object(forKey: "token") as? String) != nil) {
                ProfileView()
            } else {
                SignInView()
            }
            
        }
    }
}
