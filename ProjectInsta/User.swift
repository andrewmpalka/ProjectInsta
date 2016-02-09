//
//  File.swift
//  ProjectInsta
//
//  Created by Michael Sandoval on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import Firebase


class User: NSObject {
    
    var userID: String?
    var biography: String?
    var followers: NSMutableArray?
    var following: NSMutableArray?
    var posts: NSMutableArray?
    var username: String?
    var userKey: String?
    
    init(biography: String?, userID: String, username: String, followers: NSMutableArray, following: NSMutableArray, posts: NSMutableArray) {
        self.biography = biography!
        self.userID = userID
        self.username = username
        self.followers = followers
        self.following = following
        self.posts = posts
        
    }
    
    init(userKey: String, dictionary: Dictionary<String, AnyObject>) {
        self.userKey = userKey
    
        if let followers = dictionary["followers"] as? NSMutableArray {
            self.followers = followers
        }
        
        if let following = dictionary["following"] as? NSMutableArray {
            self.following = following
        }
        if let posts = dictionary["posts"] as? NSMutableArray {
            self.posts = posts
        }
        if let biography = dictionary["description"] as? String {
            self.biography = biography
        }
    }
    
}
