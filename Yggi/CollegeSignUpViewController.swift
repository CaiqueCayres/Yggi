//
//  CollegeSignUpViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/26/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit

class CollegeSignUpViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIImagePickerControllerDelegate {
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
    
    @IBOutlet weak var avatarGrid: UICollectionView!
    
    
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
        newRegistratingUser.child = false
        
       ParseManager.addNewUser(newRegistratingUser, completion: { () -> Void in
        println("Usuario Registrado")
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
        
        //Text fields treatment
        nameTextField.becomeFirstResponder()
        collegeTextField.becomeFirstResponder()
        degreeTextField.becomeFirstResponder()
        ageTextField.becomeFirstResponder()
        emailTextField.becomeFirstResponder()
        
        //Collection View Treatment
        avatarGrid.backgroundColor = UIColor.blueColor()
        
        // Do any additional setup after loading the view
        
    }

    // MARK Métodos da CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: UIScreen.mainScreen().bounds.width / CGFloat(6), height: UIScreen.mainScreen().bounds.width / CGFloat(6))
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellImage: AvatarCellCollectionViewCell = self.avatarGrid.dequeueReusableCellWithReuseIdentifier("cellImage", forIndexPath: indexPath) as! AvatarCellCollectionViewCell
        cellImage.avatarChoice.image = UIImage(named:"sidney")//named: imagens[indexPath.row])
        
        return cellImage
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
//        self.imagem = UIImage(named:imagens[indexPath.row])
//        self.imagemSelecionada.image = UIImage(named:imagens[indexPath.row])
//        
//        self.myCollectionView.scrollToItemAtIndexPath( indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredVertically, animated: true)
//        self.nivel = indexPath.row
//        println(self.nivel)
        
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
