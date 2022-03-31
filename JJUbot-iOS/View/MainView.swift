//
//  MainView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/28.
//

import SwiftUI

struct JJUbotList: View {
    var name: String
    var body: some View {
        Text("\(name)")
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            VStack {
                Text("JJUbot")
                    .font(Font.custom("JalnanOTF", size: 25))
                    .foregroundColor(.white)
            }
            
            ZStack {
                Section {
                    List {
                        JJUbotList(name: "JJUbot0")
                        JJUbotList(name: "JJUbot1")
                        JJUbotList(name: "JJUbot2")
                    }
                }
            }
            
            VStack {
                //배달봇 미선택하고 호출 버튼만 누를 경우, 선택하라는 경고 창 표시
                Button(action: {}) {
                    Text("배달봇 호출")
                        .foregroundColor(.mainYellow)
                        .font(Font.custom("JalnanOTF", size: 30))
                }
                .background(Color.mainBlue)
                .frame(width: 200, height: 45, alignment: .center)
            }
        }
        .background(Color.mainBlue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
