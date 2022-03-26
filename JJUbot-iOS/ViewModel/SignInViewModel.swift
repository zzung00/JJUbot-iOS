//
//  SignInViewModel.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/26.
//

import Foundation

class SignInViewModel: ObservableObject {    
    func SignInRequest(username: String, password: String) {
        JJUbotService.shared.signInJJInstar(username: username, password: password)
    }
}
