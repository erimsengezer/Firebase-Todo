//
//  AuthButton.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct AuthButton: View {
    @State var buttonTitle : String
    var body: some View {
        VStack{
            Button(action: {
                hello()
            }){
                Text(self.buttonTitle)
                    .fontWeight(.regular)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.04)
                    .shadow(color: Color.black, radius: 1.0)
                    
                    
            }
            .background(Color.black)
            .cornerRadius(10.0)
        }
    }
}

func hello(){
    print("hello")
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(buttonTitle: "Button")
    }
}
