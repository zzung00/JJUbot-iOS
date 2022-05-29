//
//  MainViewModel.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/05/28.
//

import Foundation
import CocoaMQTT

class MainViewModel: ObservableObject {
    let clientID: String
    let mqtt: CocoaMQTT
    @Published var username: String

    init(username: String) {
        self.username = username
        clientID = "JJUbot-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "localhost", port: 1883)
        mqtt.keepAlive = 60
        mqtt.connect()
    }
    
    func callJJUbot() {
        let deliveryRequeset = DeliveryRequest(username: username, destination: "307")
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(deliveryRequeset)
        mqtt.publish("/call", withString: String(data: jsonData, encoding: .utf8)!)
        print("success!!!")
    }
}

