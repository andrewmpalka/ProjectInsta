//
//  PhotoDownloader.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/10/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import UIKit

class PhotoDownloader {
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in completion(data: data, response: response, error: error)}.resume()
        
    }
    
    func downloadImageForImageView(timestamp: NSString, view: UIImageView) {
        print("download started")
        let urlString = "https://s3.amazonaws.com/projectinstant.bucket/" + (timestamp as String)
        let url = NSURL(string: urlString)
        
        getDataFromUrl(url!) { (data, response, error) -> Void in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else {return}
                print("download finished")
                let image = UIImage(data: data)
                view.image = image
                
            }

        }
    }

    
}