//
//  View3Controller.swift
//  lab3_s5
//
//  Created by Student on 19/12/2022.
//

import UIKit

class View3Controller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    

    @IBOutlet weak var imagePicked: UIImageView!
        var newPhoto = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //metoda podpięta pod przycisk Aparat
    @IBAction func openCameraButton(_ sender: Any) {
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.sourceType = .camera
         imagePicker.cameraDevice = .front
      
    imagePicker.allowsEditing = false
         self.present(imagePicker, animated: true, completion: nil)
         newPhoto = true
    } }
    //metoda podpięta pod przycisk Galeria
    @IBAction func openPhotoLibraryButton(_ sender: Any) {
      if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.sourceType = .photoLibrary
         imagePicker.allowsEditing = false
         self.present(imagePicker, animated: true, completion: nil)
    } }
    
    //metoda delegate wywołana po zrobieniu zdjęcia lub wyborze zdjęcia w galerii
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
       imagePicked.image = image
       dismiss(animated:true, completion: nil)
       //zapis zdjęcia
       if (newPhoto == true) {
           UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
           newPhoto = false
    } }
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        recognizer.view!.transform = recognizer.view!.transform.rotated(by: recognizer.rotation)
          recognizer.rotation = 0
        recognizer.delegate = self
    }
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
        recognizer.view!.transform = recognizer.view!.transform.scaledBy(
        x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1
        recognizer.delegate = self
      
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
     shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer)
     -> Bool {
   return true }
    
}
