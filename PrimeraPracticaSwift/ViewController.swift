//
//  ViewController.swift
//  PrimeraPracticaSwift
//
//  Created by Agustin Carbajal on 18/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = "Hola Agustinnnn"
    }

    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "Chauuu mundo cruel"
    }
    
}

