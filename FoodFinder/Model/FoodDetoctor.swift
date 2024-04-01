//
//  FoodDetoctor.swift
//  FoodFinder
//
//  Created by MoKhaled on 01/04/2024.
//

import UIKit
import CoreML
import Vision

class FoodDetector {
    func detect(image: CIImage, completion: @escaping (String) -> Void) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation], let firstResult = results.first else {
                fatalError("Model failed to process the image.")
            }
            
            DispatchQueue.main.async {
                let detectedObjectName = firstResult.identifier.capitalized
                completion(detectedObjectName)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
