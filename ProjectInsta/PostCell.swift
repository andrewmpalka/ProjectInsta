//
//  PostCell.swift
//  ProjectInsta
//
//  Created by Michael Sandoval on 2/9/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postDescriptionTextView: UITextView!
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    var post: Post!
    var user: User!
    
    func decodeImage() -> UIImage {
        let newImageString = post.imageString
        let imageData = newImageString.dataUsingEncoding(NSUTF8StringEncoding)
        let decodedData = NSData(base64EncodedData: imageData!, options: NSDataBase64DecodingOptions())
        let decodedImage = UIImage(data: decodedData!)
        
        return decodedImage!
        
    }
    
    
    
    
    func configureCell(post: Post) {
        self.post = post
    self.postDescriptionTextView!.text = post.postDescription
    self.numberOfLikesLabel.text = String(post.likes)
    self.usernameLabel.text = String(post.postCreator)
    self.postImageView.image = self.decodeImage()

    }
    
}

