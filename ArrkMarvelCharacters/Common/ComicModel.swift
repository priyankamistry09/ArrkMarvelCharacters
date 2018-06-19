//
//  ComicModel.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

struct ComicModel {
    var name = ""
    
    mutating func mapping(cname:String) {
        name = cname
    }

}
