//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Dan Kolan on 2/12/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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
        amountInput.keyboardType = .numberPad
        amountInput.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
        // Sets invalid input to 0
//        let usdInput : Double  = Double(amountInput.text ?? "0" ) ?? 0
        
        guard let usdInput = Double (amountInput.text ?? "0") else {
            showInvalidInputAlert()
            return
        }
        
        usd = usdInput
        
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
    
    // Restricts amountInput entry to only integer chars
    func textField(_ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String) -> Bool {  let invalidCharacters =
        CharacterSet(charactersIn: "0123456789").inverted
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
    
    func showInvalidInputAlert() {
        let alert = UIAlertController(
            title: "Invalid input",
            message: "Amount must be comprised of integer numerals.",
            preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(
            title: "Go Back",
            style: UIAlertAction.Style.default,
            handler: { _ in
              //Cancel Action
          }))
          self.present(alert, animated: true, completion: nil)
      }
}

