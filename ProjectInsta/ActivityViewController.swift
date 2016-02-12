//
//  ActivityViewController.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/7/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HERE")
        let photoDownloader = PhotoDownloader()
        let string = "Pure-CSS-Animated-Clouds.jpg"
        
    photoDownloader.downloadImageForImageView(string, view: imageView)
        // Do any additional setup after loading the view.
    }

//    
//    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
//        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in completion(data: data, response: response, error: error)}.resume()
//        
//    }
//    
//    func downloadImage(url: NSURL){
//    print("download started")
//    getDataFromUrl(url) { (data, response, error) -> Void in
//    dispatch_async(dispatch_get_main_queue()) { () -> Void in
//    guard let data = data where error == nil else {return}
//    print("download finished")
//    let image = UIImage(data: data)
//        self.imageView.image = image
//    
//    }
//        
//    }
//    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
