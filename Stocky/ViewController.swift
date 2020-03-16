//
//  ViewController.swift
//  Stocky
//
//  Created by Beatrix Lee on 02/03/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
    var labelName: String
}

struct ShapeAndAlloy {
    var shape: Int = 0
    var alloy: Int = 0
}

var items: [Item] = [Item(imageName: "1", labelName: "Social"),
                     Item(imageName: "2", labelName: "Tênis"),
                     Item(imageName: "3", labelName: "Scarpin"),
                     Item(imageName: "Group", labelName: "")]


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var buttonConfirmarCarrinho: UIButton!
    @IBOutlet var desfoqueEfeito: UIView!
    @IBOutlet var viewCarrinho: UIView!
    @IBOutlet var viewQuantidade: UIView!
    @IBOutlet var vendasCollectionView: UICollectionView!
    @IBOutlet var estoqueCollectionView: UICollectionView!
    @IBOutlet var botaoAumentar: UIButton!
    @IBOutlet var botaoDiminuir: UIButton!
    @IBOutlet var viewCadastro: UIView!
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var quantidadeEstoqueTextField: UITextField!
    @IBOutlet var valorTextField: UITextField!
    @IBOutlet var quantidadeTextField: UITextField!
    @IBOutlet var imageButton: UIButton!
    @IBOutlet var MostrarCadastroBotao: UIButton!
    @IBOutlet var mostrarQuantidadeBotao: UIButton!
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "itemCollectionViewCell"
    
    var quantidadeItemSomado: Int = 0
    var quantidadeItem: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewQuantidade.isHidden = true
        viewCarrinho.isHidden = true
        viewCadastro.isHidden = true
        desfoqueEfeito.isHidden = true
        buttonConfirmarCarrinho.layer.cornerRadius = 10
                        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        
    }
    
    func setupCollectionView() {
        
        vendasCollectionView.delegate = self
        vendasCollectionView.dataSource = self
        estoqueCollectionView.delegate = self
        estoqueCollectionView.dataSource = self
        
        let nib = UINib(nibName: "itemCollectionViewCell", bundle: nil)
        vendasCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        estoqueCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 1
            
            let width = (vendasCollectionView.frame.width - (numberOfItemPerRow - 5) * interItemSpacing) / numberOfItemPerRow
            let height = width - 10
            
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .horizontal
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            vendasCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            estoqueCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! itemCollectionViewCell
        
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 0)
        
        cell.labelNome.text = items[indexPath.item].labelName
        
        return cell
        
    }
    
    func collectionView(_ estoqueCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = estoqueCollectionView.cellForItem(at: indexPath)!
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        if indexPath.row == (items.endIndex - 1) {
            
            viewCadastro.isHidden = false
            desfoqueEfeito.isHidden = false
            
        } else if indexPath.row != (items.endIndex - 1) {
            
            viewQuantidade.isHidden = false
            desfoqueEfeito.isHidden = false
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell!.layer.borderColor = UIColor.white.cgColor
    }
    
    func cadastrarVendas() {
        
        //        let nome = nomeTextField
        //        let valor = valorTextField
        //        let quantidade = quantidadeTextField
        //        let image = imageButton
        
        
        //        let calçado = ModeloCalçado(quantidade: quantidadeInt, nome: nome, valor: valor, imagem: imageButton)
        
    }
    
    func cadastrarEstoque() {
        
        //        var estoque = estoqueCollectionView
        //
        //        if estoque = items.count {
        //
        //        }
        // ler o que está no text field de nome;
        // ler o que está no text field de valor;
        // ler o que está no text field de quantidade;
        // recebe imagem inserida pelo usuário, seja da câmera ou da galeria;
        // salva as informações de nome, valor, quantidade e imagem;
        // adiciona as informações salvas de nome, imagem e quantidade na collectionView de Estoque.
        
    }
    
    func venderItem() {
        
        // Resgata informações disponíveis de valor, nome e quantidade do item;
        // lê informação de quantidade requisitada pelo usuário;
        // confere se a quantidade disponível no sistema é compatível com a requisitada pelo usuário;
        // se for compatível, confirma a venda ao pressionar botão de confirmar e leva o item e o valor ao carrinho;
        // se não, ao pressionar botão de confirmar, responde com mensagem avisando que o valor colocado excede a quantidade disponível no estoque e esvazia a caixa de quantidade.
        
    }
    
    //    func mudarValorQuantidade(quantidade: Int) -> Int {
    //
    //
    //    }
    //
    @IBAction func QuantidadeBotao(_ sender: UIButton) {
        
        viewQuantidade.isHidden = false
        desfoqueEfeito.isHidden = false
        
        quantidadeItem = Int(quantidadeEstoqueTextField.text!)!
        
        print(quantidadeItem)
        
        if sender == botaoDiminuir {
            
            quantidadeItemSomado = quantidadeItem - 1
            
            print(quantidadeItemSomado)
            
            quantidadeEstoqueTextField.text = String(quantidadeItemSomado)
            
            if sender == botaoAumentar {
                
                quantidadeItemSomado = quantidadeItem + 1
                
                quantidadeEstoqueTextField.text = String(quantidadeItemSomado)
                
            }
            
        }
        
        
        
    }
    @IBAction func confirmarQuantidadeBotao(_ sender: Any) {
        
        viewQuantidade.isHidden = true
        desfoqueEfeito.isHidden = true
        
    }
    
    @IBAction func carrinhoBotao(_ sender: Any) {
        
        viewCarrinho.isHidden = false
        desfoqueEfeito.isHidden = false
    }
    
    @IBAction func confirmarBotaoVenda(_ sender: Any) {
        
        desfoqueEfeito.isHidden = true
        viewCarrinho.isHidden = true
        
        
    }
    
    @IBAction func fecharCarrinhoBotao(_ sender: Any) {
        
        desfoqueEfeito.isHidden = true
        viewCarrinho.isHidden = true
        
    }
    
//    @IBAction func botaoMostrarCadastro(_ sender: Any) {
//        
//        viewCadastro.isHidden = false
//        desfoqueEfeito.isHidden = false
//    }
//    
//    
    @IBAction func confirmarCadastroBotao(_ sender: Any) {
        
        viewCadastro.isHidden = true
        desfoqueEfeito.isHidden = true
    }
    
    @IBAction func botaoMenos(_ sender: UIButton) {
        
        quantidadeItem = Int(quantidadeEstoqueTextField.text!)!
        
        quantidadeItemSomado = quantidadeItem - 1
        
        quantidadeEstoqueTextField.text = String(quantidadeItemSomado)
    }
    
    @IBAction func botaoMais(_ sender: UIButton) {
        
        quantidadeItem = Int(quantidadeEstoqueTextField.text!)!
        
        quantidadeItemSomado = quantidadeItem + 1
        
        quantidadeEstoqueTextField.text = String(quantidadeItemSomado)
        
    }
    
}
