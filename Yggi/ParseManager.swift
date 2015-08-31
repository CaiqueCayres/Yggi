//
//  ParseManager.swift
//  Yggi
//
//  Created by Carlos Henrique Martins Cayres on 25/08/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit
import Parse

class ParseManager: NSObject {
    
    class func addNewUser(newUser: User ,  completion: () -> Void){
        
        var user = PFUser()
        
        user.username = newUser.name
        user.password = newUser.password
        user.email = newUser.email
        user["age"] = newUser.age
        user["gender"] =  newUser.gender
        user["child"] = newUser.child
        user["avatar"] = newUser.avatar
        
        user.signUpInBackgroundWithBlock {(succeeded: Bool, error: NSError?) -> Void in
            
            if let error = error {
                
                let errorString = error.userInfo?["error"] as? NSString
                
            } else {
                
                println("Usuario Logado")
            }
            
            completion()
        }
        
    }
    
    
    class func userLoggin(userName : String , userPassword: String , completion: () -> Void){
    
        PFUser.logInWithUsernameInBackground( userName, password: userPassword) {(user: PFUser?, error: NSError?) -> Void in
            
            if user != nil {
                
                // Do stuff after successful login.
                
            } else {
                // The login failed. Check error to see why.
            }
        }
    
    completion()
    
    }
    
    
    class func addQuestion(newQuestion : Questions ,  completion: ()-> Void){
        
        var question = PFObject(className: "question")
        
        question["createdBy"] = PFUser.currentUser()
        question["picture"] = newQuestion.questionImageData
        question["description"] = newQuestion.questionDescription
        question["finished"] = newQuestion.questionFinished
        
        question.saveInBackgroundWithBlock {(success: Bool, error: NSError?) -> Void in
            
            if (success) {
                
                println("Questao salva")
                
                completion()
                
            } else {
                println(error!.userInfo?["error"] as? NSString)
            }
        }
        
    }
    
    
    class func findQuestions(completion: ([PFObject])-> Void){
    
    let query = PFQuery(className: "questions")
        query.whereKey("finished", equalTo: false)
        query.findObjectsInBackgroundWithBlock {(objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                println("Successfully retrieved \(objects!.count) questions.")
        
                var newObjects = objects as? [PFObject]

                completion(newObjects!)
                
            }else{
              
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
      


    class func getImagefromPFFile(imageFile: PFFile , completion:(UIImage) -> Void ){
        
        imageFile.getDataInBackgroundWithBlock {
            
            (imageData: NSData?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let imageData = imageData {
                    
                    let image = UIImage(data:imageData)
                    
                    completion(image!)
                }
            }
            
        }

    }
    
    

    
    
    
}