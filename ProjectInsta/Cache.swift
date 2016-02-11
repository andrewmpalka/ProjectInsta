//
//  Cache.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/11/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit

class Cache: NSDictionary {
    
    func store(key: String, object: AnyObject){
        self.setValue(object, forKey: key)
    }
    
    func storeImageFeedUsingKeyID(object: [UIImage]) {
        self.setValue(object, forKey: KEY_ID)
    }
    
    func imageForTimestamp(timestamp: String) -> UIImage? {
        return self.objectForKey(timestamp) as? UIImage
    }
    func docForTimestamp(timestamp: String) -> AnyObject? {
            return self.objectForKey(timestamp)
    }
    func imageCacheForKeyID() -> [UIImage]? {
                return self[KEY_ID] as? [UIImage]
    }
}
