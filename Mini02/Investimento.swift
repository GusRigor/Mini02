//
//  Investimento.swift
//  Mini02
//
//  Created by Gustavo Rigor on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation

class Investimento {
    //0-CDB, 1-LCI, 2-CRI, 3-Deb
    var investimentoSelecionado: Int = 0 {
        didSet {
            UserDefaults.standard.set(investimentoSelecionado, forKey: "Investimento.investimentoSelecionado")
        }
        
    }
    private var aplicada = [10.00,20.00,30.00,40.00] {
        didSet {
            UserDefaults.standard.set(aplicada, forKey: "Investimento.aplicada")
        }
    }
    var imposto = [2.00,0.00,1.00,2.00] {
        didSet {
            UserDefaults.standard.set(imposto, forKey: "Investimento.imposto")
        }
    }
    var bruto = [15.00,23.00,35.00,30.00] {
        didSet {
            UserDefaults.standard.set(bruto, forKey: "Investimento.bruto")
        }
    }
    var lucro = [0.0,0.0,0.0,0.0] {
        didSet {
            UserDefaults.standard.set(lucro, forKey: "Investimento.lucro")
        }
    }
    private var save: Bool = false
    
    init() {
        if (UserDefaults.standard.object(forKey: "Investimento.investimentoSelecionado") != nil) {
            investimentoSelecionado = (UserDefaults.standard.object(forKey: "Investimento.investimentoSelecionado") as? Int)!
            save = true
        }
        if (UserDefaults.standard.object(forKey: "Investimento.aplicada") != nil){
            aplicada = (UserDefaults.standard.object(forKey: "Investimento.aplicada") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.imposto") != nil){
            imposto = (UserDefaults.standard.object(forKey: "Investimento.imposto") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.bruto") != nil){
            bruto = (UserDefaults.standard.object(forKey: "Investimento.bruto") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.lucro") != nil){
            lucro = (UserDefaults.standard.object(forKey: "Investimento.lucro") as? [Double])!
        }
        
    }
    
    func isSave() -> Bool{
        return self.save
    }
    func resetSave(){
        UserDefaults.standard.removeObject(forKey: "Investimento.investimentoSelecionado")
        UserDefaults.standard.removeObject(forKey: "nvestimento.aplicada")
        UserDefaults.standard.removeObject(forKey: "nvestimento.imposto")
        UserDefaults.standard.removeObject(forKey: "Investimento.bruto")
        UserDefaults.standard.removeObject(forKey: "Investimento.lucro")
    }
    func getAplicada() -> Double{
        return aplicada[investimentoSelecionado]
    }
    func setAplicada(_ x:Double){
        aplicada[investimentoSelecionado] = x
    }
    func getImposto() -> Double{
        return imposto[investimentoSelecionado]
    }
    func setImposto(_ x:Double){
        imposto[investimentoSelecionado] = x
    }
    func getBruto() -> Double{
        return bruto[investimentoSelecionado]
    }
    func setBruto(_ x:Double){
        bruto[investimentoSelecionado] = x
    }
    func getLucro() -> Double{
        return lucro[investimentoSelecionado]
    }
    func setLucro(_ x:Double){
        lucro[investimentoSelecionado] = x
    }
}


