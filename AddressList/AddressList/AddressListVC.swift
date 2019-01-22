//
//  AddressListVC.swift
//  AddressList
//
//  Created by PARTHIBAN on 21/01/19.
//  Copyright © 2019 PARTHIBAN. All rights reserved.
//

import UIKit
protocol AddressListVCDelegate {
    func selectedAddress(addres:String, isSourceAddress:Bool)
}
class AddressListVC: UIViewController {
    @IBOutlet weak var txtSearchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var delegate:AddressListVCDelegate! = nil
    let webservise = Webservice()
    var addressList = [AddressList]()
    var isSourceAddress:Bool = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 4
        tableView.clipsToBounds = true
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        txtSearchField.layer.cornerRadius = 4
        txtSearchField.clipsToBounds = true
        txtSearchField.layer.borderWidth = 0.5
        txtSearchField.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func txtFieldSearchEditingDidEnd(_ sender: Any) {
        if txtSearchField.text! == ""
        {
             self.addressList = [AddressList]()
            self.tableView.reloadData()
        }
        else
        {
            webservise.getData(searchString: txtSearchField.text!) { (result) in
                if (result as!AddressDetial).MaxCount == 0
                {
                   self.addressList = [AddressList]()
                }
                else
                {
                    self.addressList = (result as!AddressDetial).address!
                }
                self.tableView.reloadData()
            }
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

extension AddressListVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell") as! AddressListCell
        cell.lblAddress.text = addressList[indexPath.row].FullAddress
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if addressList.count > 0
        {
            self.delegate.selectedAddress(addres: addressList[indexPath.row].FullAddress!, isSourceAddress: isSourceAddress)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

