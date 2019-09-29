//
//  ViewController.swift
//  OCR
//
//  Created by Bojan Savic on 9/15/19.
	//  Copyright © 2019 Bojan Savic. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var loginButton: DesignableButton!
    @IBOutlet weak var signUpButton: DesignableButton!
    @IBOutlet weak var outpostLabel: UILabel!
    
    let tesseract: G8Tesseract = G8Tesseract(language: "eng")

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Running OCR")
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("users").child("useremail").setValue(["username": "bsbre"])
        
        tesseract.delegate = self
        tesseract.charWhitelist = "0123456789"
        
        let imageToCheck = UIImage(named: "1")
        tesseract.image = imageToCheck
        tesseract.recognize()

        logoImg.image = tesseract.image
        print("%@", tesseract.recognizedText ?? "Text not recognized!")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tap.numberOfTapsRequired = 1
        outpostLabel.isUserInteractionEnabled = true
        outpostLabel.addGestureRecognizer(tap)
        
        
    }
    
    @objc func tapGesture(_ sender: Any) {
        let url = "https://outpost.rs"
        print("Clicked breeee")
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
    
    func shouldCancelImageRecognition(for tesseract: G8Tesseract!) -> Bool {
        return false
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showCameraController", sender: nil)
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showRegisterStoryboard", sender: nil)
    }
}

