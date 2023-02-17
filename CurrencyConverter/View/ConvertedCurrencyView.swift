//
//  ConvertedCurrencyView.swift
//  CurrencyConverter
//
//  Created by Dan Kolan on 2/13/23.
//

import UIKit

class ConvertedCurrencyView: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var usdAmount: UILabel!
    
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var euroAmount: UILabel!
    
    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var poundAmount: UILabel!

    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var yenAmount: UILabel!

    @IBOutlet weak var cadDollarLabel: UILabel!
    @IBOutlet weak var canadianAmount: UILabel!

    var usd : Double = 0
    var euros : Double = 0
    var pounds : Double = 0
    var yen : Double = 0
    var cadDollars : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usdAmount.text = String(format: "%.2f", usd)
        
        euroAmount.text = euros != -1 ? String(format: "%.2f", euros) : hideDisabledCurrency(euroLabel, euroAmount)
        poundAmount.text = pounds != -1 ? String(format: "%.2f", pounds) : hideDisabledCurrency(poundLabel, poundAmount)
        yenAmount.text = yen != -1 ? String(format: "%.2f", yen) : hideDisabledCurrency(yenLabel, yenAmount)
        canadianAmount.text = cadDollars != -1 ? String(format: "%.2f", cadDollars) : hideDisabledCurrency(cadDollarLabel, canadianAmount)
    }
    
    func hideDisabledCurrency(_ currencyLabel : UILabel, _ amountLabel : UILabel) -> String {
        currencyLabel.isHidden = true
        amountLabel.isHidden = true
        
        return ""
    }
    

    @IBAction func closeModalBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
