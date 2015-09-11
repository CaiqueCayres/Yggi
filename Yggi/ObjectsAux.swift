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
 
    
    class func makeObjectToQuestion(objects:[PFObject] , completion: ([Questions]) -> Void) {
        
        var questions = [Questions]()
        
        var questionSize = objects.count

        for object in objects {
            
            var question = Questions()
            
            question.questionDescription = object["description"] as! String
            question.questionImageData = object["picture"] as! PFFile
            question.child = object["createdBy"] as! PFUser
            question.questionDate = object.createdAt!
            question.questionID = object.objectId!
            
            
            question.child.fetchIfNeededInBackgroundWithBlock({ (fetchUser, erro) -> Void in
                
            question.child = fetchUser as! PFUser
            print(question.child)
            questions.append(question)
            questionSize--
                
                if(questionSize == 0){
                    print(questions)
                completion(questions)
                }
                
            })
            
            }
     
    }
    
}
