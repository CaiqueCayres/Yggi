//
//  ReviewViewController.swift
//  Yggi
//
//  Created by Sidney Orlovski Nogueira on 8/31/15.
//  Copyright (c) 2015 Carlos Henrique Martins Cayres. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    //Foto do exercício, setada na outra view.
    var imageToBeSetted = UIImage()
    
    //Botão para enviar texto
    @IBOutlet weak var textReviewButton: UIButton!
    //Botão para enviar audio
    @IBOutlet weak var audioReviewButton: UIButton!
    //Outlet da caixa de texto
    @IBOutlet weak var textInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionPhoto.image = imageToBeSetted
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var questionPhoto: UIImageView!
    
    
    @IBAction func makeTextReview(sender: AnyObject) {
        var alertview = JSSAlertView().show(self, title: "Cadastre-se", text:"Para enviar um comentário é preciso estar cadastrada." , buttonText: "Voltar", cancelButtonText: "Cadastrar" , color: UIColorFromHex(0x3584B2, alpha: 1))
        
        alertview.addCancelAction({
            Void in
            self.performSegueWithIdentifier("cadastrar", sender: self)
        })
        alertview.addAction({
            Void in
            //self.dismissViewControllerAnimated(true, completion: nil)
            println("Vai timao")
        })
        
//        self.textReviewButton.hidden = true
//        self.audioReviewButton.hidden = true
//        self.textInput.hidden = false
        
    }
    
    @IBAction func makeAudioReview(sender: AnyObject) {
        var alertview = JSSAlertView().show(self, title: "Cadastre-se", text:"Para enviar um comentário é preciso estar cadastrada." , buttonText: "Voltar", cancelButtonText: "Cadastrar" , color: UIColorFromHex(0x3584B2, alpha: 1))
        
        alertview.addCancelAction({
            Void in
            self.performSegueWithIdentifier("cadastrar", sender: self)
        })
        alertview.addAction({
            Void in
            //self.dismissViewControllerAnimated(true, completion: nil)
            println("Vai timao")
        })
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
