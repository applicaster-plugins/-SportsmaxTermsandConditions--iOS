//
//  SportsMaxTermsViewController.swift
//  SportsmaxTermsAndConditions
//
//  Created by MSApps on 28/10/2019.
//

import Foundation

class SportsMaxTermsViewController: UIViewController{
    
    public var delegate: SportsMaxTermsBaseProtocol?
   
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func closeBtnDidPress(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.userDidSelectToClose()
        }
    }
}
