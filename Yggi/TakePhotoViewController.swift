//
//  TakePhotoViewController.swift
//  xis
//
//  Created by Carolina Bonturi on 8/26/15.
//  Copyright (c) 2015 Carolina Bonturi. All rights reserved.
//

import UIKit
import MobileCoreServices


class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePicked: UIImageView!
    var newMedia: Bool?
    
    
    
    @IBAction func TakePhoto(sender: UIButton) {
        // verify whether the device is capable of picking content from camera or not
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker = UIImagePickerController()
            
            // configuring the picker
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes = [kUTTypeImage]
            imagePicker.allowsEditing = false // indicates whether the user is allowed to edit a selected still image
            
            // presents a view controller modally
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = false
        }
    }
    
    
    @IBAction func ChooseGallery(sender: UIButton) {
        // verify whether the device is capable of picking content from camera or not
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) {
            var imagePicker = UIImagePickerController()
            
            // configuring the picker
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.mediaTypes = [kUTTypeImage]
            imagePicker.allowsEditing = false // indicates whether the user is allowed to edit a selected still image
            
            // presents a view controller modally
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = false
            
        }
    }
    
    
    
    // MARK - Delegate Methods
    
    // this function is called when user has finished taking or selecting an image. it also dismisses the imagePicker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // if everything was OK
        if mediaType.hasPrefix(kUTTypeImage as! String) {
            imagePicked.image = image
        }
        
        // if something went wrong
        if(newMedia == true) {
            UIImageWriteToSavedPhotosAlbum(image, self, "image: didFinishSavingWithError: contextInfo:", nil)
        } else if mediaType.hasPrefix(kUTTypeMovie as! String) {
            // TODO: video assingments
        }
        
    }
    
    
    
    // this function is called when the save operation is complete and reports any error occurred via an alert box
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<Void>) {
        if error != nil {
            let alert = UIAlertController(title: "OPS...", message: "Não conseguimos salvar sua imagem!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "Vou tentar novamente", style: .Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

