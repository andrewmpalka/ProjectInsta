//
//  Post.swift
//  ProjectInsta
//
//  Created by Michael Sandoval on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import Firebase

class Post {
    var postDescription: String
    var imageURL: String
    var likes: Int
    var comment: NSMutableArray
    var postKey: String
    var username: String
//    var timeStamp: String
    
    init(description: String?, imageURL: String, username: String) {
        self.postDescription = description
        self.imageURL = imageURL
        self.username = username
    }
    
    init(postKey: String, dictionary: Dictionary<String, Anyobject>) {
        self.postKey = postKey
    }
    if let likes = dictionary["likes"] as? Int {
        self.likes = likes
    }
    if let desc = dictionary["description"] as? String {
        self.postDescription = desc
    }
    if let comment = dictionary["comment"] as? String {
        self.comment = comment
    }
}
