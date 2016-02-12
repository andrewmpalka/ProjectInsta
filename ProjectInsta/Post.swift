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
    var postDescription: String!
    var likes: Int!
    var comment: NSMutableArray!
    var postKey: String?
    var username: String?
    var timeStamp: String?
    var postCreator = ""
    var imageString: NSString = ""


    //    var timeStamp: String
    
    init(description: String?, username: String, timeStamp: String, postCreator: String) {
        self.postDescription = description!
        self.username = username
        self.comment = NSMutableArray()
        self.timeStamp = timeStamp
//        self.postCreator = postCreator

    }
    
    init(postKey: String, dictionary: Dictionary<String, AnyObject>) {
        self.postKey = postKey
        
        
        if let likes = dictionary["likes"] as? Int {
            self.likes = likes
        }
        
        if let postCreator = dictionary["postCreator"] as? String {
            self.postCreator = postCreator
        }
        
        if let desc = dictionary["description"] as? String {
            self.postDescription = desc
        }
        if let comment = dictionary["comment"] as? NSMutableArray {
            self.comment = comment
        }
        if let imageString = dictionary["imageString"] as? NSString {
            self.imageString = imageString
        }
    }
}
