//
//  ObjectsAux.swift
//  Yggi
//
//  Created by Carlos Henrique Martins Cayres on 29/08/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit
import Parse

class ObjectsAux: NSObject {
 
    
    class func makeObjectToQuestion(objects:[PFObject] , completion: () -> Void) {
        
        var questions:[Questions]!
        
        var question = Questions()

        for object in objects {

            question.questionDescription = object.valueForKey("description") as! String
            question.questionImageData = object.valueForKey("picture") as! NSData
            question.child = object.valueForKey("createdBy") as! PFUser
            question.questionDate = object.createdAt!
            question.questionID = object.objectId!
            
            questions.append(question)
        }
     
        
      completion()
    }
    
    class func makePFUserToUser(user: PFUser , completion:()-> Void){
    
    
    

    
    
    }
    
}
