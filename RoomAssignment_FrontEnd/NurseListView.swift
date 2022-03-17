//
//  NurseListView.swift
//  RoomAssignment_FrontEnd
//
//  Created by Natalman Nahm on 3/14/22.
//

import SwiftUI
import Alamofire

struct NurseListView: View {
    private let baseUrl = "https://b9u0yq8uqh.execute-api.us-west-2.amazonaws.com/test"
    @State var nurse = []
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 0){
                    ForEach(self.nurse.indices, id: \.self) {index in
                        NurseCard(nurse: nurse[index] as! Nurse)
                    }
                }
                .onAppear(perform: {
                    print("hi")
                    if nurse.isEmpty{
                        DispatchQueue.main.async {
                            AF.request("\(baseUrl)/user", method: .get, encoding:
                                        JSONEncoding.default).responseJSON{ response in
                                switch response.result {
                                   case .success(let value):
                                        print(value)
                                       if let JSON = value as? [[String: Any]] {
                                           for user in JSON{
                                               let user = Nurse(id: user["id"] as! String, firstName: user["first_name"] as! String, lastName: user["last_name"] as! String, email: user["email"] as! String, age: user["age"] as? Int ?? 44)
                                               self.nurse.append(user)
                                           }
                                       }
                                   case .failure(let error):
                                       // error handling
                                        print(error)
                                        
                                   }
                            }
                        }
                    }
                    
                })
            }
            .navigationTitle("Nurse List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NurseListView_Previews: PreviewProvider {
    static var previews: some View {
        NurseListView()
    }
}
