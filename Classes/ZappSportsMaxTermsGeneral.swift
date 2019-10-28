//
//  ZappDigicelLogin.swift
//  CleengPluginExample
//
//  Created by Miri on 12/07/2019.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import Foundation
import ZappPlugins
import ApplicasterSDK

@objc public class ZappSportsMaxTermsGeneral : NSObject ,ZPAppLoadingHookProtocol, SportsMaxTermsBaseProtocol{
   
    private var navigationController: UINavigationController? = nil
    public var configurationJSON: NSDictionary?
    
    public required override init() {
        super.init()
    }
    
    public required init(configurationJSON: NSDictionary?) {
        super.init()
        self.configurationJSON = configurationJSON
    }
    
    public func userDidSelectToClose() {
        if let vc = navigationController?.presentingViewController{
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    func showTermsScreen(){
        let bundle = Bundle.init(for: type(of: self))
        let termsViewController = SportsMaxTermsViewController(nibName: "SportsMaxTermsViewController", bundle: bundle)
        termsViewController.delegate = self
        navigationController = UINavigationController(rootViewController: termsViewController)
        if let nav = navigationController{
            APApplicasterController.sharedInstance()?.rootViewController.topmostModal()?.present(nav, animated: true, completion: nil)
        }
    }
    
    public func executeAfterAppRootPresentation(displayViewController: UIViewController?, completion: (() -> Void)?) {
        if let showScreen = configurationJSON?["show_screen_at_launch"] as? String{
            if (showScreen == "1"){
                self.showTermsScreen()
            }
        }
    }
}
