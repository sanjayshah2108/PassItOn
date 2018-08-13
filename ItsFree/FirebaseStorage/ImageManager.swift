//
//  ImageManager.swift
//  ItsFree
//
//  Created by Nicholas Fung on 2017-11-20.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import Foundation
import FirebaseStorage
import UIKit
import FirebaseUI


class ImageManager {
    
    typealias uploadImageClosure = (Bool, String?) -> Void
    
    class func uploadImage(image:UIImage, userUID:String, filename:String, completion: @escaping uploadImageClosure) {
        let storageRef = Storage.storage().reference()
        let storagePath = "\(userUID)/\(filename)"
        let imageData:Data = UIImageJPEGRepresentation(image, 0.2)!
        let metedata = StorageMetadata()
        metedata.contentType = "image/jpeg"

        storageRef.child(storagePath).putData(imageData, metadata: metedata, completion: {(metadata, error) in
            
            if error == nil {
                completion(true, storagePath)
            }
            else {
                completion(false, nil)
            }
            
            
        })
    }
    class func uploadUserProfileImage(image:UIImage, userUID:String, completion: @escaping uploadImageClosure) {
        let storageRef = Storage.storage().reference()
        let storagePath = "\(userUID)/profileImage"
        let imageData:Data = UIImageJPEGRepresentation(image, 0.2)!
        let metedata = StorageMetadata()
        metedata.contentType = "image/jpeg"
        
        storageRef.child(storagePath).putData(imageData).observe(.success, handler: {(snapshot) in
            
            storageRef.child(storagePath).downloadURL(completion: {(url, error) in
                
                if error != nil {
                        completion(false, nil)
                }
                else {
                    AppData.sharedInstance.currentUser?.profileImage = url!.absoluteString
                    
                    completion(true, url!.absoluteString)
                }
                
            })
            
//            if let downloadURL = snapshot.metadata?.downloadURL()?.absoluteString {
//            // Write the download URL to the Realtime Database
//
//
//            }
//            else {
//
//            }
            
            })
        
    }
    
    

    
    
}





