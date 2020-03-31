//
//  Post.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//


import ObjectMapper

struct Post: Mappable {
    var title: String? 
    var body : String?

    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        body  <- map["body"]
    }
}