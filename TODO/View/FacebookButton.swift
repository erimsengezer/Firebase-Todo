//
//  FacebookButton.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FBSDKCoreKit
import FBSDKLoginKit

struct FacebookButton: View {
    var body: some View {
        HStack{
                Image("facebookicon")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .aspectRatio(contentMode: .fit)
        }
    }
    
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}
