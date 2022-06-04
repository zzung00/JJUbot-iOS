//
//  UserService.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/06/04.
//

import Foundation

class UserService: ObservableObject {
    @Published var username: String
    
    init(username: String) {
        self.username = username
    }
}
