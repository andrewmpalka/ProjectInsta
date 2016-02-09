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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey(KEY_ID) != nil)) {
        self.performSegueWithIdentifier("logInSegue", sender: nil)
        }
    }
    
    @IBAction func onLogInButtonTapped(sender: UIButton) {
        if let email = emailTextField.text where emailTextField != "", let pwd = passwordTextField.text where passwordTextField.text != "" {
            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                if error != nil {
                    print(error.code)
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            if error != nil {
                                self.showErrorAlert("You really fucked up", msg: "Do literally anything else you dumbass")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_ID], forKey: KEY_ID)
                                
                                DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: nil)
                                self.performSegueWithIdentifier(LOG_IN_SEGUE, sender: nil)
                            }
                            
                            }
                        )}
                    
                } else {
                    self.performSegueWithIdentifier(LOG_IN_SEGUE, sender: nil)
                }
                }
            )} else {
            showErrorAlert("Email and Password required", msg: "You must enter both an email and a password")
        }
    }
    @IBAction func onTwitterVerifyTapped(sender: UIButton) {
        
        
    }
    func showErrorAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
}
