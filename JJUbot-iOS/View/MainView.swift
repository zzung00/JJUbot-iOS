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
    
    var body: some View {
        NavigationView {
            if isActive == true {
                SendingView()
            }
            else {
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
                                ProductCard(image: "instarLogo", title: "JJUbot")
                                    .frame(alignment: .center)
                            }
                        }
                    }
                        
                    VStack {
                        //배달봇 미선택하고 호출 버튼만 누를 경우, 선택하라는 경고 창 표시
                        //다이얼로그 버튼마다 액션 추가 예정
                        Button(action: {self.showAlert = true}) {
                            Text("배달봇 호출")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.mainYellow)
                                .padding()
                                .font(Font.custom("JalnanOTF", size: 30))
                        }
                        .background(Color.mainBlue)
                        .alert(isPresented: $showAlert) {
                        Alert(title: Text("JJUbot-Service"), message: Text("배달봇을 호출하시겠습니까?"), primaryButton: .destructive(Text("예")) {
                            self.isActive = true
                            }, secondaryButton: .cancel(Text("아니오")))
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
