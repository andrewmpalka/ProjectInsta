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
    
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    var post: Post!
    var user: User!
    
    
    
    func configureCell(post: Post) {
        self.post = post
        print("\(post.postDescription)")

        

    self.postDescriptionTextView!.text = post.postDescription
    self.numberOfLikesLabel.text = String(post.likes)
//    self.numberOfLikesLabel.text = "0"
    }
    
}

