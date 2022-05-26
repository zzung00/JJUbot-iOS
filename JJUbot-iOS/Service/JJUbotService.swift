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
        let parameters = """
        <?xml version="1.0" encoding="UTF-8"?>
                <Root xmlns="http://www.nexacroplatform.com/platform/dataset">
                   <Parameters>
                      <Parameter id="fsp_action">JJLogin</Parameter>
                      <Parameter id="fsp_cmd">login</Parameter>
                      <Parameter id="GV_USER_ID">undefined</Parameter>
                      <Parameter id="GV_IP_ADDRESS">undefined</Parameter>
                      <Parameter id="fsp_logId">all</Parameter>
                      <Parameter id="MAX_WRONG_COUNT">5</Parameter>
                   </Parameters>
                   <Dataset id="ds_cond">
                      <ColumnInfo>
                         <Column id="SYSTEM_CODE" type="STRING" size="256" />
                         <Column id="MEM_ID" type="STRING" size="10" />
                         <Column id="MEM_PW" type="STRING" size="15" />
                         <Column id="MEM_IP" type="STRING" size="20" />
                         <Column id="ROLE_GUBUN1" type="STRING" size="256" />
                         <Column id="ROLE_GUBUN2" type="STRING" size="256" />
                      </ColumnInfo>
                      <Rows>
                         <Row>
                            <Col id="SYSTEM_CODE">INSTAR_WEB</Col>
                            <Col id="MEM_ID">\(username)</Col>
                            <Col id="MEM_PW">\(password)</Col>
                         </Row>
                      </Rows>
                   </Dataset>
                   <Dataset id="fsp_ds_cmd">
                      <ColumnInfo>
                         <Column id="TX_NAME" type="STRING" size="100" />
                         <Column id="TYPE" type="STRING" size="10" />
                         <Column id="SQL_ID" type="STRING" size="200" />
                         <Column id="KEY_SQL_ID" type="STRING" size="200" />
                         <Column id="KEY_INCREMENT" type="INT" size="10" />
                         <Column id="CALLBACK_SQL_ID" type="STRING" size="200" />
                         <Column id="INSERT_SQL_ID" type="STRING" size="200" />
                         <Column id="UPDATE_SQL_ID" type="STRING" size="200" />
                         <Column id="DELETE_SQL_ID" type="STRING" size="200" />
                         <Column id="SAVE_FLAG_COLUMN" type="STRING" size="200" />
                         <Column id="USE_INPUT" type="STRING" size="1" />
                         <Column id="USE_ORDER" type="STRING" size="1" />
                         <Column id="KEY_ZERO_LEN" type="INT" size="10" />
                         <Column id="BIZ_NAME" type="STRING" size="100" />
                         <Column id="PAGE_NO" type="INT" size="10" />
                         <Column id="PAGE_SIZE" type="INT" size="10" />
                         <Column id="READ_ALL" type="STRING" size="1" />
                         <Column id="EXEC_TYPE" type="STRING" size="2" />
                         <Column id="EXEC" type="STRING" size="1" />
                         <Column id="FAIL" type="STRING" size="1" />
                         <Column id="FAIL_MSG" type="STRING" size="200" />
                         <Column id="EXEC_CNT" type="INT" size="1" />
                         <Column id="MSG" type="STRING" size="200" />
                      </ColumnInfo>
                      <Rows>
                      </Rows>
                   </Dataset>
                   <Dataset id="gds_user">
                      <ColumnInfo />
                      <Rows>
                      </Rows>
                   </Dataset>
                </Root>
        """
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

