//
//  Webservice.swift
//  AddressList
//
//  Created by PARTHIBAN on 21/01/19.
//  Copyright © 2019 PARTHIBAN. All rights reserved.
//

import UIKit

class Webservice: NSObject {
    func getData(searchString:String,completion:@escaping(Any)->Void){
        let url = "https://tripplanner.riderta.com/API/api/Map/GetAutoComplete?address="+searchString
        
        URLSession.shared.dataTask(with: URL.init(string: url)!){(data,response,err) in
            DispatchQueue.main.async {
                    do {
                        let gitData = try JSONDecoder().decode(AddressDetial.self, from: data!)
                        
                        completion(gitData)
                    } catch let err {
                        print("Err", err)
                    }
            }
            }.resume()
    }
    
}

