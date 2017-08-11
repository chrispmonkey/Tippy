//
//  MainViewController.swift
//  Tippy
//
//  Created by Christopher Price on 7/21/17.
//  Copyright © 2017 Christopher Price. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomTotalsView: UIView!
    var defaultTipAmountIndex = 0
    var animate = true
    var previousBillAmount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        animate = false
        setPreviousBillAmount()
        billField.becomeFirstResponder()
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setPreviousBillAmount(){
        
        // Check to see if app hasn't been open in more than 10 minutes. If longer than 10 minutes set bill amount to 0
        let lastTimeAppWasOpen = (UserDefaults.standard.object(forKey: "LastTimeAppWasOpen")) as? Date ?? Date()
        let lastTimeAppWasOpenPlusTenMinutes = lastTimeAppWasOpen.addingTimeInterval(10.0 * 60.0)
        // Set the previous bill amount if time is less than 10 minutes
        if (lastTimeAppWasOpen < lastTimeAppWasOpenPlusTenMinutes){
            // Set the bill amount to the previous bill amount
            let checkThis = UserDefaults.standard.string(forKey: "PreviousBillAmount") ?? ""
            if(checkThis.isEmpty){
                billField.text = ""
                bottomTotalsView.isHidden = true
            }else{
                
                bottomTotalsView.isHidden = false
                billField.text = (UserDefaults.standard.string(forKey: "PreviousBillAmount"))
                animate = false
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Get default
        let defaults = UserDefaults.standard
        defaultTipAmountIndex = defaults.integer(forKey: "Default_Tip_Amount")
        tipAmountSegmentedControl.selectedSegmentIndex = defaultTipAmountIndex
        
        self.calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        // Disiss the keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        animateViews()
        //Calculate tip while bill is being edited
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:  "$%.2f", tip)
        totalLabel.text = String(format:  "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "PreviousBillAmount")
        defaults.synchronize()
    }
    
    func animateViews(){
        if(animate == true && billField.text?.characters.count == 1){
            animate = false
            bottomTotalsView.isHidden = false
            // Optionally initialize the property to a desired starting value
            self.bottomTotalsView.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.bottomTotalsView.alpha = 1
            })
        }else if(billField.text?.isEmpty == true){
            animate = true
            // Optionally initialize the property to a desired starting value
            self.bottomTotalsView.alpha = 1
            UIView.animate(withDuration: 0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.bottomTotalsView.alpha = 0
            })
            //self.bottomTotalsView.isHidden = true
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
