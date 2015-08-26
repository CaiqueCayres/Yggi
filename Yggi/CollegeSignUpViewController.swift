//
//  CollegeSignUpViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/26/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit

class CollegeSignUpViewController: UIViewController, UITextFieldDelegate {
//TextField com o nome
    @IBOutlet weak var nameTextField: UITextField!
//TextField com a universidade
    @IBOutlet weak var collegeTextField: UITextField!
//TextField com o curso
    @IBOutlet weak var degreeTextField: UITextField!
//TextField com a idade
    @IBOutlet weak var ageTextField: UITextField!
//TextField com o Email
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func signUpAction(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        collegeTextField.resignFirstResponder()
        degreeTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        var newRegistratingUser = User()
        newRegistratingUser.name = nameTextField.text
        newRegistratingUser.password = "sidney"
        newRegistratingUser.email = emailTextField.text
        newRegistratingUser.age = ageTextField.text.toInt()!
        newRegistratingUser.gender = 1
        newRegistratingUser.college = collegeTextField.text
        
        ParseManager.addNewUser(newRegistratingUser, completion: { () -> Void in
            println("Vai curintia!")
        })
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        collegeTextField.resignFirstResponder()
        degreeTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        collegeTextField.becomeFirstResponder()
        degreeTextField.becomeFirstResponder()
        ageTextField.becomeFirstResponder()
        emailTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
