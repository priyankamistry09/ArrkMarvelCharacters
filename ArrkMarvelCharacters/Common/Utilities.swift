//
//  Utilities.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

extension String {

func stringByAppendingPathExtension(ext: String) -> String? {
    let nsSt = self as NSString
    return nsSt.appendingPathExtension(ext)
}
}
