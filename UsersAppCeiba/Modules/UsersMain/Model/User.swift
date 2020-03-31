//
//  User.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//


import ObjectMapper

struct Users: Mappable {
    var user: User?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        user <- map["user"]
    }
}

struct User: Mappable {
    var id: Int?
    var name: String? 
    var phone : String?
    var email: String?

    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id    <- map["id"]
        name  <- map["name"]
        phone <- map["phone"]
        email <- map["email"]
    }
}
