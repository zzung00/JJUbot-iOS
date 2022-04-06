//
//  SendingView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/31.
//

import SwiftUI

struct SendingView: View {
    @State private var destination = ""
    @State private var reciever = ""
    
    var body: some View {
        VStack {
            ZStack {
                Section {
                    VStack {
                    Text("목적지를 입력하세요")
                        .font(Font.custom("JalnanOTF", size: 25))
                    
                    TextField("목적지", text: $destination)
                        .frame(width: 350, height: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Text("수신자 학번을 입력하세요")
                        .font(Font.custom("JalnanOTF", size: 25))
                    
                    TextField("수신자 학번", text: $reciever)
                        .frame(width: 350, height: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    }
                }
            }
        }
    }
}

struct SendingView_Previews: PreviewProvider {
    static var previews: some View {
        SendingView()
    }
}
