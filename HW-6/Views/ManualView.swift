//
//  ManualView.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 08.03.2022.
//

import UIKit

class ManualView: UIView {
    
    var addTapped: (() -> Void)?
    var moreTapped: (() -> Void)?
    
    private lazy var offerView: UIView  = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var offerLbl: UILabel  = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .light)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var titleLbl: UILabel  = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var moreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Подробнее", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        btn.tintColor = .gray
        btn.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var summLbl: UILabel  = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 4
        btn.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.backgroundColor = .blue
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private var model: CourseModel
 
    init(model: CourseModel) {
        self.model = model
        super.init(frame: .zero)
        
    
        self.titleLbl.text = model.title
        self.offerLbl.text = model.offer
        self.summLbl.text = model.coast.toCurrencyString()
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        initUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initConstraints()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.addSubviews(offerView, titleLbl, moreButton, summLbl, addButton)
        offerView.addSubview(offerLbl)
    }
    
    private func initConstraints() {
        
        offerLbl.frame.origin = CGPoint(x: 6, y: 0)
        
        offerView.frame = CGRect(x: 20, y: 20, width: offerLbl.frame.width + 12, height: offerLbl.frame.height)
                
        titleLbl.frame.origin = CGPoint(x: offerView.frame.minX, y: offerView.frame.maxY + 10)
         
        moreButton.frame.origin = CGPoint(x: offerView.frame.minX, y: titleLbl.frame.maxY + 2)
        
        summLbl.frame.origin = CGPoint(x: moreButton.frame.minX, y: moreButton.frame.maxY + 20)
        
        addButton.frame = CGRect(x: self.bounds.maxX - 92, y: summLbl.frame.midY - 18, width: 72, height: 36)
        
        self.bounds = CGRect(x: 0, y: 0, width: self.frame.width, height: addButton.frame.maxY - offerView.frame.minY + 40)
        
    }
    
    @objc
    func addButtonTapped() {
        addTapped?()
    }
    
    @objc
    func moreButtonTapped() {
        moreTapped?()
    }
}


