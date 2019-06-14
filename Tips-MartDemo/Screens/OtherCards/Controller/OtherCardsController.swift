//
//  OtherCardsController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class OtherCardsController: UIViewController {

    @IBOutlet weak var colletctionView: UICollectionView!
    
    var delegateForCollectionView = OtherCardsDSD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setDelegate()
       
    }
    
    func setDelegate(){
          delegateForCollectionView.collectionView = colletctionView
        colletctionView.delegate = delegateForCollectionView
        colletctionView.dataSource = delegateForCollectionView
        
      
    }
    @IBAction func addCard(_ sender: Any) {
        let vc = UIStoryboard(name: "AddCard", bundle: nil).instantiateViewController(withIdentifier: "addCrdVc") as! AddCartController
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
