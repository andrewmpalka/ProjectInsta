//
//  DataService.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://instagramproject.firebaseio.com/"

class DataService {
    static let ds = DataService()
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_POST = Firebase(url: "\(URL_BASE)/post")
    private var _REF_USER = Firebase(url: "\(URL_BASE)/user")
    var REF_BASE: Firebase {
            return _REF_BASE
    }
    var REF_POST: Firebase {
        return _REF_POST
    }
    var REF_USER: Firebase {
        return _REF_USER
    }
    func createFirebaseUser(uid:String, user: Dictionary<String, AnyObject>) {
        REF_USER.childByAppendingPath(uid).setValue(user)
    }
    func createFireBasePost(uid:String, post: Dictionary<String, AnyObject>) {
        REF_POST.childByAppendingPath(uid).setValue(post)
    }
}
