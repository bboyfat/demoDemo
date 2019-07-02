//
//  DetailWDView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 7/2/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
class DataForDeatailsView {
    let informationForCard = "При выводе на банковскую карту используйте только украинские карты Visa и MasterCard с валютой гривна, иначе платеж вернется обратно. "
    let firstTextFieldNameForCard = "Номер карты"
    let firstTextFieldNameForPhone = "Номер телефона"
    let cardPlaceHolder = "Например: 1111 1111 1111 1111"
    let phonePlaceHolder = "+380__ ___ __ __"
    let minSumForCard = "Минимальная сумма вывода составляет 250 грн.\nДля вывода суммы более 7000 грн. – обратитесь в Cлужбу поддержки."
    let minSumForPhone = "Минимальная сумма пополнения составляет 5 грн.\nДля вывода суммы более 7000 грн. – обратитесь в Cлужбу поддержки."
    let cardBtnText = "Вывести на карту"
    let phoneBtnTxt = "Пополнить"
}

enum WDType{
    case card
    case phone
    case none
}


class ViewModelForWdDetails{
    var view: DetailWDView!
    var dataForView = DataForDeatailsView()
    
    
    func setView(type: WDType){
        switch type{
        case .phone:
            view.firstTextFieldName.text = dataForView.firstTextFieldNameForPhone
            view.firstTextField.placeholder = dataForView.phonePlaceHolder
            view.minWdSumLabel.text = dataForView.minSumForPhone
            view.wdBtnOutlet.setTitle(dataForView.phoneBtnTxt, for: .normal)
            view.viewHeight.constant = 380
           
        case .card:
            view.firstTextFieldName.text = dataForView.firstTextFieldNameForCard
            view.firstTextField.placeholder = dataForView.cardPlaceHolder
            view.minWdSumLabel.text = dataForView.minSumForCard
            view.wdBtnOutlet.setTitle(dataForView.cardBtnText, for: .normal)
             view.viewHeight.constant = 380
           
        case .none:
            view.firstTextFieldName.text = ""
            view.firstTextField.placeholder = ""
            view.minWdSumLabel.text = ""
            view.wdBtnOutlet.setTitle("", for: .normal)
            view.viewHeight.constant = 0
            
        }
    }
    
    init(view: DetailWDView) {
        self.view = view
    }
    
    
}


class DetailWDView: UIView {
    let nibName = "DetailWDView"
    
    var contentVIew: UIView?
    
    @IBOutlet weak var firstTextFieldName: UILabel!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var minWdSumLabel: UILabel!
    @IBOutlet weak var wdBtnOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        guard let view = loadViewFromNib() else {return}
        view.frame = self.bounds
        self.addSubview(view)
        contentVIew = view
        
    }
    
    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
    
}
