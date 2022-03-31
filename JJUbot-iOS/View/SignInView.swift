//
//  SignInView.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/26.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            Image("jjLogo")
            
            Text("로그인 하세요")
                .bold()
                .font(Font.custom("JalnanOTF", size: 30))
                .foregroundColor(.mainBlue)
            
            VStack {
                TextField("학번을 입력하세요", text: $username)
                    .keyboardType(.decimalPad)
                    .frame(width: 300, height: 40, alignment: .center)
                    .cornerRadius(4.0)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("비밀번호를 입력하세요", text: $password)
                    .keyboardType(.default)
                    .frame(width: 300, height: 40, alignment: .center)
                    .cornerRadius(4.0)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
            }
            
            VStack {
                Button(action: {viewModel.SignInRequest(username: username, password: password)}) {
                    Text("로그인")
                        .font(Font.custom("JalnanOTF", size: 20))
                        .foregroundColor(.mainYellow)
                }
                .frame(width: 200, height: 45, alignment: .center)
                .background(Color.mainBlue)
                .cornerRadius(6.0)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
