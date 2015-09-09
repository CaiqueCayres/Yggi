//
//  BeforeSignUpCollegeViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/29/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit
import Parse

class BeforeSignUpCollegeViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    
    @IBOutlet weak var universitariaView: UICollectionView!
    
     var feedQuestions = [Questions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universitariaView.backgroundView = UIView()
        var background = UIImageView()
        background.image = UIImage(named: "madeira")
        universitariaView.backgroundView?.addSubview(background)
        
        
        //Busca as perguntas no Parse
        ParseManager.findQuestions{ (questions) -> Void in
            
            self.feedQuestions = questions
            println(self.feedQuestions)
            self.universitariaView.reloadData()
            
        //apos encontrar as perguntas no Parse comeco a buscar as imagens de cada pergunta
            for quests in self.feedQuestions {
                quests.questionImage = UIImage(data: quests.questionImageData.getData()!)!
                self.universitariaView.reloadData()
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Metodo que retorna para a tela inicial
    @IBAction func returnView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    //Segue para tela de cadastro!
    @IBAction func signUpSegue(sender: AnyObject) {
        performSegueWithIdentifier("signUpCollege", sender: self)
        
    }
    
    // MARK Métodos da CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return feedQuestions.count
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: screenWidth - 20, height: screenHeight / CGFloat(3))
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellImage: BeforeSignUpCollegeCollectionViewCell = self.universitariaView.dequeueReusableCellWithReuseIdentifier( "exerciseCell", forIndexPath: indexPath) as! BeforeSignUpCollegeCollectionViewCell
        
        cellImage.exerciseImage.image = self.feedQuestions[indexPath.row].questionImage
        cellImage.nameLabel.text = self.feedQuestions[indexPath.row].child.username
        
        //cellImage.ageLabel.text = self.feedQuestions[indexPath.row].child["age"] as? String
        let age = self.feedQuestions[indexPath.row].child["age"] as! NSNumber
        cellImage.ageLabel.text = age.stringValue
        
        return cellImage
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        performSegueWithIdentifier("showQuestion", sender: self)
        println("Vai timao")
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showQuestion") {
            var nextView = segue.destinationViewController as! ReviewViewController
            nextView.imageToBeSetted = UIImage(named: "Questao Ygg")!
        }
    }

}
