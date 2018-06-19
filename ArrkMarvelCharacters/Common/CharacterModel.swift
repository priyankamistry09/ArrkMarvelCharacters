//
//  CharacterModel.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//


import Foundation

struct CharacterModel {
    var id = 0
    var name = ""
    var description = ""
    var thumbImageUrl = ""
    var comics = [ComicModel]()
    
    mutating func mapping(cid:Int, cname:String, cdescription:String, cthumbImageUrl:String, chComics:[ComicModel] ) {
        id  = cid
        name = cname
        description = cdescription
        thumbImageUrl  = cthumbImageUrl
        comics = chComics
    }
}

