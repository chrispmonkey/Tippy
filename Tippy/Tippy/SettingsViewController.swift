//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Christopher Price on 7/21/17.
//  Copyright © 2017 Christopher Price. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipAmountSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipAmountDefault = defaults.integer(forKey: "Default_Tip_Amount")
        defaultTipAmountSegmentedControl.selectedSegmentIndex = tipAmountDefault
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipAmountChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipAmountSegmentedControl.selectedSegmentIndex, forKey: "Default_Tip_Amount")
        defaults.synchronize()
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
