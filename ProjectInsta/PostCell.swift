//
//  PostCell.swift
//  ProjectInsta
//
//  Created by Michael Sandoval on 2/9/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    var post: Post!
//    var user: User!
    
    
    
    func configureCell(post: Post) {
        self.post = post
        print("\(post.postDescription)")
//        self.user = user
        
//    self.textLabel?.text = user.email
    self.detailTextLabel!.text = post.postDescription
        //display the likes text label in here
        //self.likeslabel.text = "\(post.likes)"
    }
}

