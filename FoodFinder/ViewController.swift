//
//  ViewController.swift
//  FoodFinder
//
//  Created by MoKhaled on 30/03/2024.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }
    
    func detect(image: CIImage) {
        
        // Load the ML model through its generated class
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("can't load ML model")
        }
    }
}
