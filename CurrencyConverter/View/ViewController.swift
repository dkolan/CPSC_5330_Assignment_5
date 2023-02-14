//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Dan Kolan on 2/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountInput: UITextField!
    
    @IBOutlet weak var euroSwitch: UISwitch!
    @IBOutlet weak var poundSwitch: UISwitch!
    @IBOutlet weak var yenSwitch: UISwitch!
    @IBOutlet weak var canadianDollarSwitch: UISwitch!
    var currencyLogic = CurrencyLogic()
    
    var usd : Double = 0
    var euros : Double = 0
    var pounds : Double = 0
    var yen : Double = 0
    var cadDollars : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
        let usdInput : Double  = Double(amountInput.text ?? "0" ) ?? 0
        
        usd = usdInput
        print(usd)
        
//        if euroSwitch.isOn {
//            euros = currencyLogic.convertToEuro(usdInput)
//        }
//
//        if poundSwitch.isOn {
//            pounds = currencyLogic.convertToSterling(usdInput)
//        }
//
//        if yenSwitch.isOn {
//            yen = currencyLogic.convertToJapaneseYen(usdInput)
//        }
//
//        if canadianDollarSwitch.isOn {
//            cadDollars = currencyLogic.convertToCanadian(usdInput)
//        }
        
        euros = euroSwitch.isOn ? currencyLogic.convertToEuro(usdInput) : -1
        pounds = poundSwitch.isOn ? currencyLogic.convertToSterling(usdInput) : -1
        yen = yenSwitch.isOn ? currencyLogic.convertToJapaneseYen(usdInput) : -1
        cadDollars = canadianDollarSwitch.isOn ? currencyLogic.convertToCanadian(usdInput) : -1

        self.performSegue(withIdentifier: "toConverted", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConverted" {
            let navigation = segue.destination as! ConvertedCurrencyView
            navigation.usd = usd
            navigation.euros = euros
            navigation.pounds = pounds
            navigation.yen = yen
            navigation.cadDollars = cadDollars
        }
    }
}

