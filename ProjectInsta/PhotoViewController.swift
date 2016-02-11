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
    
        
        
    

    @IBAction func onShareButtonTapped(sender: AnyObject) {
        var timeString: String {
            return "\(NSDate().timeIntervalSince1970 * 1000)"
        }
        
        let image = imageView.image
        self.uploadImage(image!, key: timeString)
        
//        let postCreator = Firebase(url: "\(REF_USER_CURRENT)").childByAppendingPath("Email")
        
        var postCreatorRoot = Firebase(url: "https://instagramproject.firebaseio.com/")
        var postCreatorURL = postCreatorRoot.childByAppendingPath("user")
        var postCreatorEmail = postCreatorURL.childByAppendingPath("Email")
//        var 
        
        
        let post: Dictionary<String, AnyObject> = [
        "description": captionTextView.text,
        "likes": 0,
        "timeStamp": timeString,
        "postCreator": postCreatorEmail
        
        ]
        
        
        
//        self.post.postCreator = postCreator

        
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
