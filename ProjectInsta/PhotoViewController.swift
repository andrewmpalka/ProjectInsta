//
//  PhotoViewController.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/7/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit
import Firebase

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var choosePhoto: UIButton!
    @IBOutlet weak var takePicture: UIButton!
    
    var base64String: NSString?
    
    var REF_USER_CURRENT: Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_ID) as! String
        let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("user").childByAppendingPath(uid)
        return user
    }
    

    var thePostOwner: String?
    var postCreator: String?
    var post: Post!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        captionTextView.hidden = true
        shareButton.hidden = true
        captionTextView.editable = false
        shareButton.enabled = false
        
    
    }
    
    
    @IBAction func onChooseButtonTapped(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func onTakeButtonTapped(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
    
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion: nil)
        }
        else {
            print("No Camera")
        }
    }
   
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        captionTextView.hidden = false
        shareButton.hidden = false
        captionTextView.editable = true
        shareButton.enabled = true
        choosePhoto.enabled = false
        choosePhoto.hidden = true
        takePicture.hidden = true
        takePicture.enabled = false
    }
    
    
    
    var timeString: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    @IBAction func onShareButtonTapped(sender: AnyObject) {
       
        
        let image = imageView.image
//        self.uploadImage(image!, key: timeString)
        var uploadImage: UIImage = imageView.image!
        var imageData: NSData = UIImageJPEGRepresentation(uploadImage, 0.5)!
        self.base64String = imageData.base64EncodedStringWithOptions([])

        

        
        
        var REF_USER_CURRENT: Firebase {
            let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_ID) as! String
            let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("user").childByAppendingPath(uid)
            return user
        }
       
        
        REF_USER_CURRENT.childByAppendingPath("username").observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            
            print(snapshot.value)
            print(snapshot.key)
            self.postCreator = snapshot.value as? String
            self.sendPostToFirebase()
        })
        
        
         
//        let postCreatorURL = REF_USER_CURRENT.childByAppendingPath("Email")
//        let postCreator = String(postCreatorURL)

    }
        func sendPostToFirebase() {
        let post: Dictionary<String, AnyObject> = [
            "description": captionTextView.text,
            "likes": 0,
            "timeStamp": timeString,
            "postCreator": postCreator!,
            "imageString": base64String!
        
        ]
        
        
        

        
        let fbPost = DataService.ds.REF_POST.childByAutoId()
        fbPost.setValue(post)
        self.captionTextView.text = ""
        self.imageView.image = nil
        captionTextView.hidden = true
        shareButton.hidden = true
        captionTextView.editable = false
        shareButton.enabled = false
        choosePhoto.enabled = true
        choosePhoto.hidden = false
        takePicture.hidden = false
        takePicture.enabled = true
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
