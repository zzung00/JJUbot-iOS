//
//  SendingView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/31.
//

import SwiftUI

struct SendingView: View {
    @State private var source = ""
    @State private var destination = ""
    @State private var reciever = ""
    @State private var showAlert = false
    @State private var isActive = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mqttService: MQTTService
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        if self.isActive == true {
            ConfirmView()
        }else {
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
                                .padding(15)
                            }
                            Text("배송 정보를 정확하게 입력해주세요")
                                .foregroundColor(.black)
                                .font(Font.custom("JalnanOTF", size: 17))
                                .frame(width: 300)
                                .padding(5)
                        }
                    }
                    .padding([.trailing], 70)
                    .padding([.top], 20)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("출발지 *")
                                .foregroundColor(.black)
                                .font(Font.custom("JalnanOTF", size: 17))
                                .frame(width: 90, height: 20, alignment: .topLeading)
                                .padding(5)
                            
                            TextField("배송지를 입력해주세요", text: $source)
                                .frame(width: 280, height: 70)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                            
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
                    .padding([.leading, .trailing, .vertical], 30)
                    .padding([.bottom], 70)
                    
                    VStack {
                        Button(action: {showAlert = true}) {
                            Text("배달봇 호출")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.mainYellow)
                                .padding()
                                .font(Font.custom("JalnanOTF", size: 30))
                        }
                        .background(Color.mainBlue)
                        .disabled(source.isEmpty || destination.isEmpty || reciever.isEmpty)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("JJUbot-Service"), message: Text("배송지: \(destination) 수령인: \(reciever)" + "호출하시겠습니까?"), primaryButton: .destructive(Text("예")) {
                                self.isActive = true
                                mqttService.callJJUbot(username: userService.username, destination: destination)
                            }, secondaryButton: .cancel(Text("아니오")))
                        }
                    }
                    .padding([.top], 180)
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
