//
//  DataEntities.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON

struct DataEntitie {
    
    let artistName : String?
    let artworkUrl100 : String?
    let copyright : String?
    let id : String?
    let kind : String?
    let name : String?
    let releaseDate : String?
    let url : String?
    
    init(json : JSON) {
        self.artistName = dimeString(json: json, nombre: "artistName")
        self.artworkUrl100 = dimeString(json: json, nombre: "artworkUrl100")
        self.copyright = dimeString(json: json, nombre: "copyright")
        self.id = dimeString(json: json, nombre: "id")
        self.kind = dimeString(json: json, nombre: "kind")
        self.name = dimeString(json: json, nombre: "name")
        self.releaseDate = dimeString(json: json, nombre: "releaseDate")
        self.url = dimeString(json: json, nombre: "url")
    }
    
}

