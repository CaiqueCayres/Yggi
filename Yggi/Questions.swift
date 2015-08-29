//
//  Questions.swift
//  Yggi
//
//  Created by Carlos Henrique Martins Cayres on 25/08/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit
import Parse

class Questions: NSObject {
   
    var questionID = String()
    var child = PFUser()
    var questionImageData = NSData()
    var questionDescription = String()
    var questionDate = NSDate()
    var questionFinished = Bool()
    
    
}
