//
//  SplashView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Text("JJU")
            .font(Font.custom("JalnanOTF", size: 40))
            .bold()
            .foregroundColor(.mainBlue)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
