//
//  DataService.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    private var _REF_BASE = Firebase(url: "https://instagramproject.firebaseio.com/")
    
    var REF_BASE: Firebase {
            return _REF_BASE
    }
}
