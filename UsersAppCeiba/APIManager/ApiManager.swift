//
//  ApiManager.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import Alamofire

class ApiManager {
    
    func callServiceObject(service: Router, withCompletionBlock: CallServiceHandlerWithAnyObject) {
        AF.request(service)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("value: ", value)
                   
                    if response.response?.statusCode == 404 {
                        let error = NSError(domain: "error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Usuario o constraseña incorrecta"])
                        withCompletionBlock?(nil, error)
                        return
                    }
                    
                    withCompletionBlock?(value, nil)
                    
                    break
                case .failure(let error):
                    self.logError(error, response: response)
                    
                    withCompletionBlock?(nil, error)
                    
                    break
                }
        }
    }
    
    private func logError(_ error: Error, response: AFDataResponse<Any>) {
        print("\n\n===========Error===========")
        print("Error Code: \(error._code)")
        print("Error Messsage: \(error.localizedDescription)")
        if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
            print("Server Error: " + str)
        }
        debugPrint(error as Any)
        print("===========================\n\n")
    }

}
