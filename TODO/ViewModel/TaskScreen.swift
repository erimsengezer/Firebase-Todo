//
//  TaskScreen.swift
//  TODO
//
//  Created by Erim Şengezer on 24.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Firebase
struct TaskScreen: View {
    @State var login = false
    var body: some View {
        NavigationView{
            if login == false {
               TabView{
                   Text("The First Tab")
                       .tabItem {
                           Image(systemName: "1.square.fill")
                           Text("First")
                       }
                   Text("Another Tab")
                       .tabItem {
                           Image(systemName: "2.square.fill")
                           Text("Second")
                       }
                   Button(action: {
                       do{
                        try Auth.auth().signOut()
                        self.login = true
                       }catch{
                           print("error")
                       }

                   }){
                       Text("Logout")
                   }
                       .tabItem {
                           Image(systemName: "3.square.fill")
                           Text("Third")
                       }
               }
           }else{
                LoginScreen()
            }
            }.navigationBarHidden(true)
    }
}

struct TaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskScreen()
    }
}
