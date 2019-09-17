//
//  LocalizationsModel.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class LocalizationsModel: CoreObject {
    
    var deObject = [DeLocalizationsModel]()
    var enObject = [EnLocalizationsModel]()
    var jaObject = [JaLocalizationsModel]()
    var koObject = [KoLocalizationsModel]()
    var esObject = [EsLocalizationsModel]()
    var frObject = [FrLocalizationsModel]()
    var ptObject = [PtLocalizationsModel]()
    
    init(dict: [String : Any]) {
        if let deData = dict["de"] as? [String: Any],
            let enData = dict["en"] as? [String: Any],
            let jaData = dict["ja"] as? [String: Any],
            let koData = dict["ko"] as? [String: Any],
            let esData = dict["es-419"] as? [String: Any],
            let frData = dict["fr"] as? [String: Any],
            let ptData = dict["pt-BR"] as? [String: Any] {
            
            deObject.append(DeLocalizationsModel(dict: deData))
            enObject.append(EnLocalizationsModel(dict: enData))
            jaObject.append(JaLocalizationsModel(dict: jaData))
            koObject.append(KoLocalizationsModel(dict: koData))
            esObject.append(EsLocalizationsModel(dict: esData))
            frObject.append(FrLocalizationsModel(dict: frData))
            ptObject.append(PtLocalizationsModel(dict: ptData))
        }
    }

}
