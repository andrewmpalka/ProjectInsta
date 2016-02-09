//
//  File.swift
//  ProjectInsta
//
//  Created by Michael Sandoval on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import Firebase


class user: NSObject {
    
    var userID: String
    var biography: String
    var followers = [NSMutableArray]
    var following = [NSMutableArray]
    var posts = [NSMutableArray]
    var username: String
    
    init() {
        <#code#>
    }
}
