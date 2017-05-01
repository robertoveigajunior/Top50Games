//
//  Constants.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 01/05/17.
//  Copyright © 2017 Games. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let entityGameApp = "GameApp"
    static let errorLoadData = "Ops, tente mais tarde!"
    static let errorSaveData = "Ops, falhou ao tentar salvar!"
    static let msgLoadGames = "Não foi possível atualizar os Games.\n Verifique sua conexão e tente novamente!"
    static let errorLoadDB = "Erro ao inicializar o Banco de Dados interno"
    static let errorMigrating = "Falha ao tentar migrar o Banco de Dados"
    static let msgNoInternet = "Os games não foram atualizados, mas você pode utilizar o aplicativo offline.\nVerifique a internet e tente atualizar mais tarde!"
    
    static let imageDefault = UIImage(named: "icon-game")
}
