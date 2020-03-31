//
//  UserViewModel.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

class UserViewModel {

    // Internal Properties
    var posts: [Post] = []
    var user: User? 

    // Internal Private Properties
    private let apiManager = ApiManager()

    // Internal Computed Properties
    
    var numberOfPosts: Int {
        return posts.count
    }

    // MARK: - Internal Methods

    func getPosts(userId: Int?, handler: CallServiceHandler) {
        guard let userId = userId else {
            let error = NSError(domain: "", code: 00, userInfo: [NSLocalizedDescriptionKey: "El campo userId es obligatorio"])
            handler?(nil, error)
            return
        }

        let parameters = ["userId": userId] as [String: AnyObject]
        
        apiManager.callServiceObject(service: .Posts(parameters)) { [weak self] (result, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            strongSelf.posts.removeAll()
            
            if let error = error {
                handler?(false, error)
            } else if let result = result {
                if let jsonResult = result as? [[String: AnyObject]] {
                    
                    print("getPosts JSON\n", jsonResult)
                    
                    strongSelf.posts = Mapper<Post>().mapArray(JSONArray: jsonResult)
                    
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
