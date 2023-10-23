//
//  ViewController.swift
//  PrimeraPracticaSwift
//
//  Created by Agustin Carbajal on 18/10/2023.
//

import UIKit

class ViewController: UIViewController {

    // todos los controles deberian de UI control (superclase), osea de UIkit (superclase comun para UI control)
    
    
    //Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myLoaderView: UIPickerView!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    
    
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
        myPicker.isHidden = true
        //page controls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .red
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //segmented controls
        //usamos enuramated porque me devuelve el index y tambien el elemento
        //antes de que se ejecute la carga necesitamos borrar los que trae por defecto el segmento, para eso utilizamos la funcion removeAll
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated() {
            //en cada vuelta del bucle insetamos un elemento
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        
        //slider controls (por ej para reproductores de musica)
        mySlider.maximumTrackTintColor = .green
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        //stepper
        myStepper.value = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //switch
        mySwitch.onTintColor = .red
        mySwitch.isOn = false
        
        //progress indicators
        myProgressView.progress = 0
        
        //activity indicator
        myActivityIndicator.color = .red
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
        
        //labels
        myStepperLabel.textColor = .red
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Está apagado"
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
        mySlider.value = Float(myPageControl.currentPage + 1)
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
    }
    
    //segmented control
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPicker.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex + 1)
    }
    
    //slider
    @IBAction func mySliderAction(_ sender: Any) {
        
        var progress: Float = 0
        
        switch mySlider.value {
        case 1..<2:
            let myString = myPickerViewValues[0]
            myButton.setTitle(myString, for: .normal)
            myPicker.selectRow(0, inComponent: 0, animated: true)
            myPageControl.currentPage = 0
            mySegmentedControl.selectedSegmentIndex = 0
            progress = 0.2
        case 2..<3:
            let myString = myPickerViewValues[1]
            myButton.setTitle(myString, for: .normal)
            myPicker.selectRow(1, inComponent: 0, animated: true)
            myPageControl.currentPage = 1
            mySegmentedControl.selectedSegmentIndex = 1
            progress = 0.4
        case 3..<4:
            let myString = myPickerViewValues[2]
            myButton.setTitle(myString, for: .normal)
            myPicker.selectRow(2, inComponent: 0, animated: true)
            myPageControl.currentPage = 2
            mySegmentedControl.selectedSegmentIndex = 2
            progress = 0.6
        case 4..<5:
            let myString = myPickerViewValues[3]
            myButton.setTitle(myString, for: .normal)
            myPicker.selectRow(3, inComponent: 0, animated: true)
            myPageControl.currentPage = 3
            mySegmentedControl.selectedSegmentIndex = 3
            progress = 0.8
        default:
            let myString = myPickerViewValues[4]
            myButton.setTitle(myString, for: .normal)
            myPicker.selectRow(4, inComponent: 0, animated: true)
            myPageControl.currentPage = 4
            mySegmentedControl.selectedSegmentIndex = 4
            progress = 1
        }
        myProgressView.progress = progress
    }
    
    //stepper
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        mySlider.value = Float(value)
        myStepperLabel.text = "\(value)"
    }
    
    //switch
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPicker.isHidden = false
            myActivityIndicator.stopAnimating()
            mySwitchLabel.text = "Está encendido"
        }else{
            myPicker.isHidden = true
            myActivityIndicator.startAnimating()
            mySwitchLabel.text = "Está apagado"
        }
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
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.value = Float(row + 1)
    }
}
