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
    
    
    
    class func addNewChild(newUser: User ,  completion: () -> Void){
    
        var user = PFUser()
        user.username = newUser.name
        user.password = newUser.password
        user.email = newUser.email
        user["age"] = newUser.age
        user["gender"] =  newUser.gender
        user["type"] = newUser.type
        //user["avatar"] = newUser.avatar
        
        user.signUpInBackgroundWithBlock {(succeeded: Bool, error: NSError?) -> Void in

            if let error = error {
                
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
            } else {
                
               println("Usuario Logado")
            }
        
            completion()
        }
   
    }
    
    
    class func addNewCollege(newUser: User ,  completion: () -> Void){
        
        var user = PFUser()
        user.username = newUser.name
        user.password = newUser.password
        user.email = newUser.email
        user["age"] = newUser.age
        user["gender"] =  newUser.gender
        user["type"] = newUser.type
        //user["avatar"] = newUser.avatar
        
        user.signUpInBackgroundWithBlock {(succeeded: Bool, error: NSError?) -> Void in
            
            if let error = error {
                
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
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
        question.saveInBackgroundWithBlock {(success: Bool, error: NSError?) -> Void in
            
            if (success) {
               println("Questao salva")
            } else {
                println(error!.userInfo?["error"] as? NSString)
            }
        }
        
        completion()
    }
    
    
    class func findQuestions(completion: ()-> Void){
    
    let query = PFQuery(className: "Question")
        query.whereKey("finished", equalTo: false)
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil{
                println(objects)
            }
            
        })
        

    }
    



}