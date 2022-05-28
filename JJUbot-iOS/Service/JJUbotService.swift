//
//  JJUbotService.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/25.
//

import Foundation
import Alamofire
import SWXMLHash

class JJUbotService {
    static let baseUrl = "https://instar.jj.ac.kr/XMain"
    static let shared = JJUbotService()
    
    func signInJJInstar(username: String, password: String, completion: @escaping (String?) -> Void) {
        let parameters = signInXmain(username: username, password: password)
        let url = URL(string: JJUbotService.baseUrl)
        var request = URLRequest(url: url!)
        request.httpBody = parameters.data(using: String.Encoding.utf8, allowLossyConversion: true)
        request.httpMethod = "POST"
        request.addValue("application/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("application/xml", forHTTPHeaderField: "Accept")
        
        AF.request(request).responseData {
            reponse in
            let result = String(bytes: reponse.data!, encoding: .utf8)!
            
            let xml = XMLHash.lazy(result)
            do {
                let info = try xml["Root"]["Dataset"].withAttribute("id", "ds_info")
                let signInResponse = try info["Rows"]["Row"]["Col"].withAttribute("id", "MEM_INFO").element!.text
                completion(signInResponse)
            }
            catch {
                completion(nil)
            }
        }
    }
}

