//
//  CollegeSignUpViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/26/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit

class CollegeSignUpViewController: UIViewController {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
