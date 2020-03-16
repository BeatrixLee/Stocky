//
//  ModeloCalçado.swift
//  Stocky
//
//  Created by Beatrix Lee on 10/03/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class ModeloCalçado {
    
    var quantidade: Int?
    var nome: String?
    var valor: Double?
    var imagem: UIImage?
    
    init(quantidade: Int, nome: String, valor: Double, imagem: UIImage) {
        
        self.quantidade = quantidade
        self.nome = nome
        self.valor = valor
        self.imagem = imagem
        
    }
}
