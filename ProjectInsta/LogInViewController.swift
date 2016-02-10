//
//  LogInViewController.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/8/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    var ref: Firebase!
    var authHelper: TwitterAuthHelper!
    var accounts: [ACAccount]!
    var account = ACAccount()
    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      var window: UIWindow?
    var auth: FAuthData! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.appDelegate.login()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        ref = Firebase(url:"https://instagramproject.firebaseio.com/")
        authHelper = TwitterAuthHelper(firebaseRef:ref, apiKey: "rV9QqoE4d7aYzoidVJfrvOwmy")
        
//        if (NSUserDefaults.standardUserDefaults().valueForKey(KEY_ID) != nil && DataService.ds.REF_USER.authData != nil) {
//        self.performSegueWithIdentifier("logInSegue", sender: nil)
        }
    
    @IBAction func onLogInButtonTapped(sender: UIButton) {
        if let email = emailTextField.text where emailTextField != "", let pwd = passwordTextField.text where passwordTextField.text != "", let username = usernameTextField.text where usernameTextField != "" {
            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                if error != nil {
                    print(error.code)
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            if error != nil {
                                self.showErrorAlert("You really fucked up", msg: "Do literally anything else you dumbass")
                            } else {
                                
                                                                
//                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_ID], forKey: KEY_ID)

                                
                                DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: {
                                    err, authData in
                                    
                                    let user = ["provider": authData.provider!, "Email":"\(email)", "username":"\(username)"]
                                    DataService.ds.createFirebaseUser(authData.uid, user: user)
                                    
                                    NSUserDefaults.standardUserDefaults().setObject(authData.uid, forKey:KEY_ID)
                                    NSUserDefaults.standardUserDefaults().synchronize()
                                    
                                    self.appDelegate.login()
                                })
                                
//                                self.performSegueWithIdentifier(LOG_IN_SEGUE, sender: nil)
                            }
                            }
                        )}
                } else {
                    NSUserDefaults.standardUserDefaults().setObject(authData.uid, forKey: "\(authData.uid)")
                    NSUserDefaults.standardUserDefaults().synchronize()
//                    let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    self.appDelegate.login()

//                    self.performSegueWithIdentifier(LOG_IN_SEGUE, sender: nil)
                }
                }
            )} else {
            showErrorAlert("Email and Password required", msg: "You must enter both an email and a password")
        }
    }
    @IBAction func onTwitterVerifyTapped(sender: UIButton) {
               self.authWithTwitter()
    }
    func showErrorAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
}
