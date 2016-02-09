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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        
        DataService.ds.REF_POST.observeEventType(.Value, withBlock: { snapshot in
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
//                    print("SNAP \(snap)")

                    if let postDictionary = snap.value as? (Dictionary<String, AnyObject>) {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDictionary)
                        self.posts.append(post)
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
        let cell = (tableView.dequeueReusableCellWithIdentifier("CellID"))
        let post = posts[indexPath.row]
        cell?.textLabel?.text = post.username
        cell?.detailTextLabel?.text = post.postDescription
        print(post.postDescription)
        return cell!
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
