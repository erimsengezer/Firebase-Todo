//
//  TwitterButton.swift
//  TODO
//
//  Created by Erim Şengezer on 19.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import SwiftUI

struct TwitterButton: View {
    var body: some View {
        Button(action: {
            print("twitter")
        }) {
            Image("twittericon")
                .resizable()
                .foregroundColor(Color.gray)
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct TwitterButton_Previews: PreviewProvider {
    static var previews: some View {
        TwitterButton()
    }
}
