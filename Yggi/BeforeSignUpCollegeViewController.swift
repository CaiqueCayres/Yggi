//
//  BeforeSignUpCollegeViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/29/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit

class BeforeSignUpCollegeViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    
    @IBOutlet weak var universitariaView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK Métodos da CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
        
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
        cellImage.exerciseImage.image = UIImage(named: "Questao Ygg")

        return cellImage
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
//        self.imagem = UIImage(named:imagens[indexPath.row])
//        self.imagemSelecionada.image = UIImage(named:imagens[indexPath.row])
//        
//        self.myCollectionView.scrollToItemAtIndexPath( indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredVertically, animated: true)
//        self.nivel = indexPath.row
        println("Vai timao")
        
    }

}
