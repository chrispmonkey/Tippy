//
//  AppDelegate.swift
//  Tippy
//
//  Created by Christopher Price on 7/21/17.
//  Copyright © 2017 Christopher Price. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var userDefaultsDefaults = [:] as [String:Any]
        if (UserDefaults.standard.value(forKey: "Default_Tip_Amount") == nil){
            userDefaultsDefaults = [
                "Default_Tip_Amount" : 0
                ] as [String:Any]
            UserDefaults.standard.register(defaults: userDefaultsDefaults)
        }else if (UserDefaults.standard.value(forKey: "PreviousBillAmount") == nil){
            userDefaultsDefaults = [
                "PreviousBillAmount" : ""
                ] as [String:Any]
            UserDefaults.standard.register(defaults: userDefaultsDefaults)
        }else if (UserDefaults.standard.value(forKey: "LastTimeAppWasOpen") == nil){
            userDefaultsDefaults = [
                "LastTimeAppWasOpen" : Date()
                ] as [String:Any]
            UserDefaults.standard.register(defaults: userDefaultsDefaults)
        }
        
        print("Default Tip Amount: ", UserDefaults.standard.value(forKey: "Default_Tip_Amount") ?? "N/A")
        print("Previous Bill Amount: ", UserDefaults.standard.value(forKey: "PreviousBillAmount") ?? "N/A")
        print("Last Time App was Open: ", UserDefaults.standard.value(forKey: "LastTimeAppWasOpen") ?? "N/A")
        
        UITextField.appearance().keyboardAppearance = .dark
        return true
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Store the Bill amount if the app is about to be terminated and the time the app has been open is less than 10 minutes
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "LastTimeAppWasOpen")
        //defaults.set(MainViewController.setPreviousBillAmount(MainViewController), forKey: "String")
        defaults.synchronize()
    }
    
    
}

