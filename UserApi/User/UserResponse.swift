//
//  UserResponse.swift
//  UserApi
//
//  Created by Akash Belekar on 16/03/23.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

struct UserResponse:Mappable{
    var id:Int?
    var body:String?
    var postId:Int?
    var user:UserNameResponse?
    
    init?(map: ObjectMapper.Map) {
        
    }
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        body <- map["body"]
        postId <- map["postId"]
        user <- map["user"]
    }
}

struct UserNameResponse:Mappable{
    //var user:[userData]?
   // var id:Int?
    var userName:String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    mutating func mapping(map: ObjectMapper.Map) {
      
       // id <- map["id"]
        userName <- map["username"]
    }
}

struct UserDataResponse:Mappable{
    var comments:[UserResponse]?
    
    init?(map: ObjectMapper.Map) {
        
    }
    mutating func mapping(map: ObjectMapper.Map) {
        comments <- map["comments"]
    }
}
