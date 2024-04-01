//
//  ViewController.swift
//  FoodFinder
//
//  Created by MoKhaled on 30/03/2024.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.originalImage] as? UIImage {
            imageView.image = userPickedImage
            guard  let ciimage = CIImage(image: userPickedImage) else{
                fatalError("Could not convert UIImage to CIImage")
                
            }
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func detect (image:CIImage) {
          guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
              fatalError("Loading CoreML Model Failed.")
          }
        let requst = VNCoreMLRequest(model: model) { requst, error in
            guard let results = requst.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process the image.")
            }
            print(results)
        }
      }
  
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    

    }

