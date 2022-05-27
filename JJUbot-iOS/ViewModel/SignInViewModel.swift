//
//  SignInViewModel.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/26.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var name: String? = ""
    @Published var isSuccess: Bool = false
    @Published var showToast = false
    
    func SignInRequest(username: String, password: String) {
        JJUbotService.shared.signInJJInstar(username: username, password: password) {
            result in
            if result == nil {
                self.isSuccess = false
                self.showToast = true
            } else {
                self.isSuccess = true
                self.name = result
            }
        }
    }
}
