//
//  XibView.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 07.03.2022.
//

import UIKit

class XibView: UIView {
    
    var addTapped: (() -> Void)?
    var moreTapped: (() -> Void)?
    

    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var summLbl: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    private var model: CourseModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 10)

        offerView.layer.borderColor = UIColor.gray.cgColor
        offerView.layer.borderWidth = 1
        offerView.layer.cornerRadius = 8
        
        addButton.setTitle("", for: .normal)
        addButton.layer.cornerRadius = 6

    }
    
    func configure(with model: CourseModel) {
        self.model = model
        
        self.titleLbl.text = model.title
        self.offerLbl.text = model.offer
        self.summLbl.text = model.coast.toCurrencyString()
        
    }
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        moreTapped?()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        addTapped?()
    }
    
}
