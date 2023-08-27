//
//  ViewController.swift
//  App Gasolina ou Alcool
//
//  Created by Bella Damião on 27/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    
    @IBOutlet weak var btConfig: UIButton!
    
    @IBOutlet weak var lgdResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btConfig.layer.cornerRadius = 6
        lgdResultado.layer.cornerRadius = 6
        lgdResultado.layer.masksToBounds = true
    }
    
    @IBAction func calcCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text{
                
               let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos {
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                }else{
                    lgdResultado.text = "Digite os preços para calcular!"
                }
                
            }
        }
    }
    
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
                
                let resultadoPreco = valorAlcool / valorGasolina
                
                if resultadoPreco >= 0.7{
                    self.lgdResultado.text = "É melhor usar Gasolina!"
                }else{
                    self.lgdResultado.text = "É melhor usar Álcool!"
                }
                
           }
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool
    {
       var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        }else if precoGasolina.isEmpty{
            camposValidados = false
        }
        
        
        return camposValidados
    }
    
}

