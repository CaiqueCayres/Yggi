//
//  ChildSignUpViewController.swift
//  Yggi
//
//  Created by Carolina Bonturi on 8/26/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import Foundation
import UIKit

class ChildSignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets & Actions
    // child's name. unwrapped because it can be nil
    @IBOutlet weak var name: UITextField!
    // child's age
    @IBOutlet weak var age: UITextField!
    // child's scholar fase
    @IBOutlet weak var serie: UITextField!
    // parent's e-mail
    @IBOutlet weak var email: UITextField!
    
    
    @IBAction func signUpAction(sender: AnyObject) {
        name.resignFirstResponder()
        age.resignFirstResponder()
        serie.resignFirstResponder()
        email.resignFirstResponder()
        
        var newRegistratingUser = User()
        newRegistratingUser.name = name.text
        newRegistratingUser.password = "sidney" // TODO
        newRegistratingUser.email = email.text
        newRegistratingUser.age = age.text.toInt()!
        newRegistratingUser.gender = 1 // TODO
        newRegistratingUser.type = 0
        newRegistratingUser.college = "teste"
        newRegistratingUser.serie = serie.text.toInt()!
        
        
        
        ParseManager.addNewUser(newRegistratingUser, completion: { () -> Void in
            println("New user added!")
        })
        
        ParseManager.findQuestions({ () -> Void in
            println("festa")
        } )
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        age.resignFirstResponder()
        serie.resignFirstResponder()
        email.resignFirstResponder()
        
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.becomeFirstResponder()
        age.becomeFirstResponder()
        serie.resignFirstResponder()
        email.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
