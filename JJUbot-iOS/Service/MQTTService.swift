//
//  MQTTService.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/06/04.
//

import Foundation
import CocoaMQTT

class MQTTService: ObservableObject {
    let clientID: String
    let mqtt: CocoaMQTT

    init() {
        clientID = "JJUbot-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "localhost", port: 1883)
        mqtt.keepAlive = 60
        mqtt.connect()
        print("mqttConnect!!!!")
    }
    
    func callJJUbot(source: String, username: String, destination: String) {
        let deliveryRequeset = DeliveryRequest(source: source, username: username, destination: destination)
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(deliveryRequeset)
        mqtt.publish("/call", withString: String(data: jsonData, encoding: .utf8)!)
        print("success!!!")
    }
}
