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
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    //variables
    private let myPickerViewValues = ["Uno", "Dos", "tres", "cuatro", "cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //buttons
        myButton.setTitle("Mi Botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //pickers
        myPicker.backgroundColor = .lightGray
        // para poder hacer el data source y el delegate vamos a necesitar extender con "extension", para separa nuetro codigo
        myPicker.dataSource = self //le estamos indicando que clase se va a encargar de proporcionar los elementos y le decimos que la propia, osea el propio viewcontroller. Implementamos su protocolo, el cual nos va a ayudar a cargarle datos
        myPicker.delegate = self // sobre quien queremos crear el delegado, sobre el view controller
        
        //page controls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .red
        myPageControl.pageIndicatorTintColor = .lightGray
        
    }

    //actions
    
    //buttons
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .red
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    //pageControls
    //seleccion componente 0 porque tengo una sola columna
    // cada vez que seleccionamos un puntito, modifica el select row y el page
    @IBAction func myPageControlAction(_ sender: Any) {
        myPicker.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
    }
}

//son los dos protocolos que queremos delegar sobre ViewController
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    //datasource habitualmente sirve para cargar datos en la vista
    //delegate sirve para interactuar con el viewcontroller
    
    // Aca empiezan las de data source
    // numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numero de items
    //COMPONENTE SIRVE PARA VER EN CUAL PICKER VIEW ESTAMOS PORQUE PODEMOS TENER VARIOS
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //seria el equivalente al .length
        return myPickerViewValues.count
    }
    
    //los elementos que se van a mostrar
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    
    //aca empiezan las de delegate
    //vamos a seleccionar un elemento
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
            
        //entonces cada vez que modifica el selected row, se modifica tambien el myPageControl
        myPageControl.currentPage = row
    }
}
