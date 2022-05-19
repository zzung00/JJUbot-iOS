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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.lightGray
                .ignoresSafeArea()
            
            VStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding(20)
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text("배송 정보를 정확하게 입력해주세요")
                    .foregroundColor(.black)
                    .font(Font.custom("JalnanOTF", size: 17))
                    .frame(width: 300)
                    .position(x: 150, y: 80)
            }
        }
    }
}

struct SendingView_Previews: PreviewProvider {
    static var previews: some View {
        SendingView()
    }
}


//                            TextField("목적지", text: $destination)
//                                .frame(width: 350, height: 100)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .keyboardType(.default)
//                                .disableAutocorrection(true)
//
//                            Text("수신자 학번을 입력하세요")
//                                .font(Font.custom("JalnanOTF", size: 25))
//
//                            TextField("수신자 학번", text: $reciever)
//                                .frame(width: 350, height: 100)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .keyboardType(.default)
//                                .disableAutocorrection(true)
