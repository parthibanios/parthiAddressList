//
//  Model.swift
//  AddressList
//
//  Created by PARTHIBAN on 21/01/19.
//  Copyright © 2019 PARTHIBAN. All rights reserved.
//

import UIKit

struct AddressDetial: Codable {
    var address: [AddressList]?
    var MaxCount: Int?
}
struct AddressList: Codable {
    var P_ID : Int?
    var FullAddress : String?
    var category : String?
    var PlaceID: String?
}
