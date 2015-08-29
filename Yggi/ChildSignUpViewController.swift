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
    // child's scholar phase
    @IBOutlet weak var serie: UITextField!
    // parent's e-mail
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var avatarGrid: UICollectionView!
    
    @IBAction func signUpAction(sender: AnyObject) {
        name.resignFirstResponder()
        age.resignFirstResponder()
        serie.resignFirstResponder()
        email.resignFirstResponder()
        
        var newRegistratingUser = User()
        newRegistratingUser.name = name.text
        newRegistratingUser.password = "sidney" // TODO
        newRegistratingUser.email = email.text
        
        //Verifica se o que foi digitado realmente é um número!
        var aux = age.text.toInt()
        if aux != nil {
            newRegistratingUser.age = age.text.toInt()!
        }
        
        newRegistratingUser.gender = 1 // TODO
        newRegistratingUser.child = true
        newRegistratingUser.college = "teste"
        newRegistratingUser.serie = serie.text.toInt()!
        
        
        
        ParseManager.addNewUser(newRegistratingUser, completion: { () -> Void in
        println("Usuario Registrado")
        })
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        age.resignFirstResponder()
        serie.resignFirstResponder()
        email.resignFirstResponder()
        
        
        return true
    }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.becomeFirstResponder()
        age.becomeFirstResponder()
        serie.resignFirstResponder()
        email.becomeFirstResponder()
        
        
        //Setup da collection view
        avatarGrid.backgroundColor = UIColor.greenColor()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK Métodos da CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
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

  }
