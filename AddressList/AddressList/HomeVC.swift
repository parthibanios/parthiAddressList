//
//  HomeVC.swift
//  AddressList
//
//  Created by PARTHIBAN on 22/01/19.
//  Copyright © 2019 PARTHIBAN. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var txtFieldDestAdd: UITextField!
    @IBOutlet weak var txtFieldSourceAdd: UITextField!
    var isSourceAddress:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didBeginEditingSourceTxtField(_ sender: Any) {
       
        self.view.endEditing(true)
        let addressListVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddressListVC") as? AddressListVC
        addressListVC?.isSourceAddress = true
        addressListVC?.delegate = self
        self.navigationController?.pushViewController(addressListVC!, animated: true)

    }
    
    @IBAction func didBeginEditingDestinationTxtField(_ sender: Any) {
        self.view.endEditing(true)
        let addressListVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddressListVC") as? AddressListVC
        addressListVC?.isSourceAddress = false
        addressListVC?.delegate = self
        self.navigationController?.pushViewController(addressListVC!, animated: true)
    }
}

extension HomeVC:AddressListVCDelegate
{
    func selectedAddress(addres: String, isSourceAddress: Bool) {
        if isSourceAddress
        {
            self.txtFieldSourceAdd.text = addres
        }
        else
        {
            self.txtFieldDestAdd.text = addres
        }
    }
    
    
}
