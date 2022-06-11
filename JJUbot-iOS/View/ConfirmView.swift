//
//  ConfirmView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/05/18.
//

import SwiftUI

struct ConfirmView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(.mainBlue)
                    .frame(width: 150, height: 150)
                    .padding(50)
                        
                Text("배달봇이 성공적으로 호출됐어요!")
                    .foregroundColor(.black)
                    .font(Font.custom("JalnanOTF", size: 20))
                    .frame(width: 300)
            }
            .padding([.bottom], 250)
            Spacer()
        }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
