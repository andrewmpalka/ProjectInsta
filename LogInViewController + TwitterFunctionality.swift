//
//  LogInViewController + TwitterFunctionality.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/9/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension LogInViewController {
    func authWithTwitter() {
        authHelper.selectTwitterAccountWithCallback { (error, accounts) -> Void in
            self.accounts = accounts as? [ACAccount]
            self.selectTwitterAccount(self.accounts)
            self.handleMultipleTwitterAccounts(self.accounts)
        }
    }
    
    func authAccount(account: ACAccount) {
        authHelper.authenticateAccount(account, withCallback: { (error, authData) -> Void in
            if error != nil {
                // There was an error authenticating
            } else {
                // We have an authenticated Twitter user
                NSLog("%@", authData)
                // segue to chat
//                self.performSegueWithIdentifier(LOG_IN_SEGUE, sender: authData)
                NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "\(authData.uid)")
                NSUserDefaults.standardUserDefaults().synchronize()
                
//                let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                self.appDelegate.login()
            }
        })
    }
    
    func selectTwitterAccount(accounts: [ACAccount]) {
        let selectUserAlertController = UIAlertController(title: "Select Twitter Account", message: "Please choose your account", preferredStyle: .ActionSheet)
        
        for account in accounts {
            selectUserAlertController.addAction(UIAlertAction(title: account.username, style: .Default, handler: { alertAction in
                let currentTwitterHandle = account.username
                for acc in accounts {
                    if acc.username == currentTwitterHandle {
                        self.authAccount(acc)
                    }
                }
                }
                )
            )
            //            selectUserActionSheet.addButtonWithTitle(account.username)
        }
        selectUserAlertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        //        selectUserActionSheet.cancelButtonIndex = selectUserActionSheet.addButtonWithTitle("Cancel")
        presentViewController(selectUserAlertController, animated: true, completion: nil)
    }
    
    func handleMultipleTwitterAccounts(accounts: [ACAccount]) {
        switch accounts.count {
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/signup")!)
        case 1:
            self.authAccount(accounts[0])
        default:
            self.selectTwitterAccount(accounts)
        }
    }
    
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    //        var messagesVc = segue.destinationViewController as! MessagesViewController
    //        if let authData = sender as? FAuthData {
    //            messagesVc.user = authData
    //            messagesVc.ref = ref
    //            messagesVc.sender = authData.providerData["username"] as! String
    //        }
    //    }
}
