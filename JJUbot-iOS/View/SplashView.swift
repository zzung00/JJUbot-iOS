//
//  SplashView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        HStack {
            Text("JJU")
                .font(Font.custom("JalnanOTF", size: 50))
                .bold()
                .foregroundColor(.mainBlue)
                .position(x: 170, y: 300)
            //
            HStack {
                Text("Bot")
                    .font(Font.custom("JalnanOTF", size: 50))
                    .bold()
                    .foregroundColor(.mainBlue)
                    .position(x: 70, y: 350)
            }
            HStack {
                Image("instarLogo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.mainYellow)
                    .frame(width: 70, height: 70)
                    .position(x: -10, y: 300)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
