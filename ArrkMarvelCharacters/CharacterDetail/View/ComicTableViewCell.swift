//
//  ComicTableViewCell.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    @IBOutlet weak var comicLabel: UILabel!

    func setData(forComic comic: ComicModel) {
        self.selectionStyle = .none
        comicLabel?.text = comic.name 
    }

}
