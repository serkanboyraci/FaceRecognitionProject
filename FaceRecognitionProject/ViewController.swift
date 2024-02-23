//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Ali serkan Boyracı  on 3.10.2022.
//

import UIKit
import LocalAuthentication //to use faceID or fingerID

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: Any) {
        let authContext = LAContext() // to use LAcontext class
        
        var error : NSError? // to define error
        
        // you can change withBiometrics
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        //if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) { // error to pointer you must use &
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it You?") { (success, error) in
                
                if success == true {
                    //successful auth
                    DispatchQueue.main.async { // not to crash in main thread
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else  {
                    DispatchQueue.main.async { // not to crash in main thread
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
}

