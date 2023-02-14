//
//  ConvertedCurrencyView.swift
//  CurrencyConverter
//
//  Created by Dan Kolan on 2/13/23.
//

import UIKit

class ConvertedCurrencyView: UIViewController {

    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var euroAmount: UILabel!
    @IBOutlet weak var poundAmount: UILabel!
    @IBOutlet weak var yenAmount: UILabel!
    @IBOutlet weak var canadianAmount: UILabel!
    
    var usd : Double = 0
    var euros : Double = 0
    var pounds : Double = 0
    var yen : Double = 0
    var cadDollars : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usdAmount.text = "Amount in USD: " + String(format: "%.2f", usd)
        euroAmount.text = String(format: "%.2f", euros)
        poundAmount.text = String(format: "%.2f", pounds)
        yenAmount.text = String(format: "%.2f", yen)
        canadianAmount.text = String(format: "%.2f", cadDollars)
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
