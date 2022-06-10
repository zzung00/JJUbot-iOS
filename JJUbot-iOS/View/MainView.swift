//
//  MainView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/28.
//

import SwiftUI

struct MainView: View {
    @State private var showAlert = false
    @State private var isActive = false
    @StateObject private var mqttService = MQTTService()
    private var userService: UserService
    
    init(username: String) {
        userService = UserService(username: username)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("배달봇 찾기")
                    .font(Font.custom("JalnanOTF", size: 20))
                    .foregroundColor(.black)
                    .navigationTitle("JJUbot")
                    .navigationBarTitleDisplayMode(.inline)
                    
                ZStack {
                    Color.lightGray
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            //LazyVGrid 적용 예정
                            ProductCard(image: "instarLogo", title: "JJUbot")
                                .frame(alignment: .center)
                        }
                    }
                }
                        
                VStack {
                    Button(action: {self.showAlert = true}) {
                        Text("배송지 입력")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.mainYellow)
                            .padding()
                            .font(Font.custom("JalnanOTF", size: 30))
                    }
                    .background(Color.mainBlue)
                    .alert(isPresented: $showAlert) {
                    Alert(title: Text("JJUbot-Service"), message: Text("배송지를 입력하시겠습니까?"), primaryButton: .destructive(Text("예")) {
                        self.isActive = true
                        }, secondaryButton: .cancel(Text("아니오")))
                    }
                    .sheet(isPresented: $isActive) {
                        SendingView()
                    }
                }
            }
        }
        .environmentObject(mqttService)
        .environmentObject(userService)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(username: "")
    }
}
