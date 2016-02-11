//
//  HomeViewController.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/7/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit
import Firebase
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    var users = [User]()
    var post = Post!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var REF_USER_CURRENT: Firebase {
//            let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_ID) as! String
//            let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("user").childByAppendingPath(uid)
//            return user
//        }
//        
//        REF_USER_CURRENT.childByAppendingPath("Email").observeSingleEventOfType(.Value, withBlock: { snapshot in
//            print(self.post)
//            print(snapshot.value)
//            self.post.postCreator = "test"
//            
//        })
        
        
        
        
        DataService.ds.REF_POST.observeEventType(.Value, withBlock: { snapshot in
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
//                    print("SNAP \(snap)")

                    if let postDictionary = snap.value as? (Dictionary<String, AnyObject>) {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDictionary)
                        self.posts.insert(post, atIndex: 0)
                    }
                }
            }
            self.tableView.reloadData()
        
        })
        
        DataService.ds.REF_USER.observeEventType(.Value, withBlock: { snapshot in
            self.users = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
//                  print("SNAP \(snap)")
                    
                    if let userDictionary = snap.value as? (Dictionary<String, AnyObject>) {
                        let uKey = snap.key
                        let user = User(userKey: uKey, dictionary: userDictionary)
                        self.users.append(user)
                    
                    }
                }
            }
            self.tableView.reloadData()
        })
    
        
        }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
//        let user = users[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell
        {
    
            cell.configureCell(post)
            return cell
        } else {
                return PostCell()
            }
    
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    

}
