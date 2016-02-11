//
//  PhotoViewController+AWSS3.swift
//  ProjectInsta
//
//  Created by Andrew Palka on 2/9/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

import UIKit
import AWSS3

extension PhotoViewController {
        //MARK: S3 stuff
    func uploadImage(image: UIImage, key: NSString) {
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        let path = NSTemporaryDirectory().stringByAppendingString("temp")
        let testFileURL1 = NSURL(fileURLWithPath: path)
        let uploadRequest1 : AWSS3TransferManagerUploadRequest = AWSS3TransferManagerUploadRequest()
        
        let data = UIImageJPEGRepresentation(image, 0.5)
        data!.writeToURL(testFileURL1, atomically: true)
        uploadRequest1.bucket = "projectinstant.bucket"
        uploadRequest1.key =  key as String
        uploadRequest1.body = testFileURL1
        
        let task = transferManager.upload(uploadRequest1)

        task.continueWithBlock { _ in
            if task.error != nil {
                print("Error: \(task.error)")
            } else {
                print("Upload successful")
                
            }
            return nil
        }
      
    }
//    let uploadRequest = AWS
//        func uploadToS3(){
/*
            // get the image
            var img:UIImage = selectedImage!.image!
            
            // create a local image that we can use to upload to s3
            var path:NSString = NSTemporaryDirectory().stringByAppendingPathComponent("image.png")
            var imageData:NSData = UIImagePNGRepresentation(img)
            imageData.writeToFile(path, atomically: true)
            
            // once the image is saved we can use the path to create a local fileurl
            var url:NSURL = NSURL(fileURLWithPath: path)!
            
            // next we set up the S3 upload request manager
            uploadRequest = AWSS3TransferManagerUploadRequest()
            // set the bucket
            uploadRequest?.bucket = "s3-demo-swift"
            // I want this image to be public to anyone to view it so I'm setting it to Public Read
            uploadRequest?.ACL = AWSS3ObjectCannedACL.PublicRead
            // set the image's name that will be used on the s3 server. I am also creating a folder to place the image in
            uploadRequest?.key = "foldername/image.png"
            // set the content type
            uploadRequest?.contentType = "image/png"
            // and finally set the body to the local file path
            uploadRequest?.body = url;
            
            // we will track progress through an AWSNetworkingUploadProgressBlock
            uploadRequest?.uploadProgress = {[unowned self](bytesSent:Int64, totalBytesSent:Int64, totalBytesExpectedToSend:Int64) in
                
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    self.amountUploaded = totalBytesSent
                    self.filesize = totalBytesExpectedToSend;
                    self.update()
                    
                })
            }
            
            // now the upload request is set up we can creat the transfermanger, the credentials are already set up in the app delegate
            var transferManager:AWSS3TransferManager = AWSS3TransferManager.defaultS3TransferManager()
            // start the upload
            transferManager.upload(uploadRequest).continueWithExecutor(BFExecutor.mainThreadExecutor(), withBlock:{ [unowned self]
                task -> AnyObject in
                
                // once the uploadmanager finishes check if there were any errors
                if(task.error != nil){
                    NSLog("%@", task.error);
                }else{ // if there aren't any then the image is uploaded!
                    // this is the url of the image we just uploaded
                    NSLog("https://s3.amazonaws.com/s3-demo-swift/foldername/image.png");
                }
                
                self.removeLoadingView()
                return "all done";
                })
            
        }
        
        func update(){
            var percentageUploaded:Float = Float(amountUploaded) / Float(filesize) * 100
            progressLabel?.text = NSString(format:"Uploading: %.0f%%", percentageUploaded)
        }
        
        // Mark: camera and IBAction stuff
        
        @IBAction func cameraBtnClicked(sender: UIButton){
            imagePickerController = UIImagePickerController()
            imagePickerController?.delegate = self
            imagePickerController?.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(imagePickerController!, animated: true, completion: nil)
        }
        
        @IBAction func galleryBtnClicked(sender: UIButton){
            imagePickerController = UIImagePickerController()
            imagePickerController?.delegate = self
            imagePickerController?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePickerController!, animated: true, completion: nil)
        }
        
        @IBAction func uploadBtnClicked(sender: UIButton){
            self.createLoadingView()
            self.uploadToS3()
        }
        
        func imagePickerController(picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
                picker.dismissViewControllerAnimated(true, completion: nil)
                selectedImage?.image = (info["UIImagePickerControllerOriginalImage"] as UIImage)
        }
        
        func createLoadingView(){
            loadingBg = UIView(frame: self.view.frame)
            loadingBg?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
            self.view.addSubview(loadingBg!)
            
            progressView = UIView(frame: CGRectMake(0, 0, 250, 50))
            progressView?.center = self.view.center
            progressView?.backgroundColor = UIColor.whiteColor()
            loadingBg?.addSubview(progressView!)
            
            progressLabel = UILabel(frame: CGRectMake(0, 0, 250, 50))
            progressLabel?.textAlignment = NSTextAlignment.Center
            progressView?.addSubview(progressLabel!)
            progressLabel?.text = "Uploading:";
        }
        
        func removeLoadingView(){
            loadingBg?.removeFromSuperview()
        }
*/
//    }
    
    
}
