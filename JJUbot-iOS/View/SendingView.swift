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
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Button(action:{self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding(20)
                        }
                        Text("배송 정보를 정확하게 입력해주세요")
                            .foregroundColor(.black)
                            .font(Font.custom("JalnanOTF", size: 17))
                            .frame(width: 300)
                            .padding(5)
                    }
                }
                .padding([.trailing], 70)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("배송지 *")
                            .foregroundColor(.black)
                            .font(Font.custom("JalnanOTF", size: 17))
                            .frame(width: 90, height: 20, alignment: .topLeading)
                            .padding(5)
                        
                        TextField("배송지를 입력해주세요", text: $destination)
                            .frame(width: 280, height: 70)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                        
                        Text("수령인 *")
                            .foregroundColor(.black)
                            .font(Font.custom("JalnanOTF", size: 17))
                            .frame(width: 90, height: 20, alignment: .topLeading)
                            .padding(5)
                        
                        TextField("수령인을 입력해주세요", text: $reciever)
                            .frame(width: 280, height: 70)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                    }
                }
                .padding([.leading, .trailing, .vertical], 50)
                .padding([.bottom], 100)
                
                VStack {
                    Button(action: {print("!!!!!!!!!!!!!")}) {
                        Text("배달봇 호출")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.mainYellow)
                            .padding()
                            .font(Font.custom("JalnanOTF", size: 30))
                    }
                    .background(Color.mainBlue)
                    .disabled(destination.isEmpty || reciever.isEmpty)
                }
                .padding([.top], 190)
            }
        }
    }
}

struct SendingView_Previews: PreviewProvider {
    static var previews: some View {
        SendingView()
    }
}

//호출 버튼 누르면 alert로 정보 재 확인 표시 (예: )
