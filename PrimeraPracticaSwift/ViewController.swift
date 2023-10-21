//
//  ViewController.swift
//  PrimeraPracticaSwift
//
//  Created by Agustin Carbajal on 18/10/2023.
//

import UIKit

class ViewController: UIViewController {

    
    //Outlets
    @IBOutlet weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //buttons
        myButton.setTitle("Mi Botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
    }

    //actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .red
        } else {
            myButton.backgroundColor = .blue
        }
    }
}

