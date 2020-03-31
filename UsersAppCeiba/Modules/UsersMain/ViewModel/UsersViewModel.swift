//
//  UsersViewModel.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

class UsersViewModel {

    // Internal Properties
    var users: [User] = []
    var usersMappable: Users?
    var originalUsersList: [User] = []

    // Internal Private Properties
    private let apiManager = ApiManager()

    // Internal Computed Properties
    
    var numberOfUsers: Int {
        return users.count
    }

    // MARK: - Internal Methods

    func getUsers(handler: CallServiceHandler) {
        if let jsonUsers = SessionHelper.getSession(key: "Users") as? [[String : Any]] {
            
            users = Mapper<User>().mapArray(JSONArray: jsonUsers)
            originalUsersList = Mapper<User>().mapArray(JSONArray: jsonUsers)
            
            handler?(true, nil)
            
            return
        }
        
        apiManager.callServiceObject(service: .Users) { [weak self] (result, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            strongSelf.users.removeAll()
            
            if let error = error {
                handler?(false, error)
            } else if let result = result {
                if let jsonResult = result as? [[String: AnyObject]] {
                    
                    print("getUsers JSON\n", jsonResult)
                    
                    strongSelf.users = Mapper<User>().mapArray(JSONArray: jsonResult)
                    strongSelf.originalUsersList = Mapper<User>().mapArray(JSONArray: jsonResult)
                    
                    let dictionary = strongSelf.users.toJSON()
                    UserDefaults.standard.set(dictionary, forKey: "Users")
                    UserDefaults.standard.synchronize()
                    
                    handler?(true, nil)
                } else {
                    handler?(nil, nil)
                }
            } else {
                handler?(nil, nil)
            }
        }
    }

}
