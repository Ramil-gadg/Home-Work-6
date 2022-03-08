//
//  LayoutView.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 07.03.2022.
//

import UIKit

class LayoutView: UIView {
    
    var addTapped: (() -> Void)?
    var moreTapped: (() -> Void)?
    
    private lazy var offerView: UIView  = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
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
        btn.translatesAutoresizingMaskIntoConstraints = false
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
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.addSubviews(offerView, titleLbl, moreButton, summLbl, addButton)
        offerView.addSubview(offerLbl)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            
            offerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            offerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            offerView.widthAnchor.constraint(equalTo: offerLbl.widthAnchor, constant: 12),
            offerView.heightAnchor.constraint(equalTo: offerLbl.heightAnchor),

            offerLbl.leftAnchor.constraint(equalTo: offerView.leftAnchor, constant: 6),
            offerLbl.centerYAnchor.constraint(equalTo: offerView.centerYAnchor),
            
            titleLbl.leftAnchor.constraint(equalTo: offerView.leftAnchor),
            titleLbl.topAnchor.constraint(equalTo: offerView.bottomAnchor, constant: 12),
            
            moreButton.leftAnchor.constraint(equalTo: offerView.leftAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 20),
            moreButton.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 4),

            summLbl.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 24),
            summLbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            summLbl.rightAnchor.constraint(greaterThanOrEqualTo: addButton.leftAnchor, constant: -10),

            addButton.centerYAnchor.constraint(equalTo: summLbl.centerYAnchor),
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 36),
            addButton.widthAnchor.constraint(equalToConstant: 72),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
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

