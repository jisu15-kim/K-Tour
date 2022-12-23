//
//  HotFestaCell.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/23.
//

import UIKit
import Kingfisher

class HotFestaCell: UICollectionViewCell {
    
    var item: FestaItem?
    
    var thumnailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupUI() {
        addSubview(thumnailImage)
        addSubview(titleLabel)
        
        setupConstraints()
        configure()
        
        thumnailImage.layer.cornerRadius = self.bounds.width / 2
        thumnailImage.clipsToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thumnailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thumnailImage.topAnchor.constraint(equalTo: self.topAnchor),
            thumnailImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            thumnailImage.widthAnchor.constraint(equalTo: thumnailImage.heightAnchor, multiplier: 1.0),
            
            titleLabel.topAnchor.constraint(equalTo: thumnailImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    private func configure() {
        if let safeItem = item {
            let imageUrl = URL(string: safeItem.firstimage)
            
            self.thumnailImage.kf.setImage(with: imageUrl)
            self.titleLabel.text = safeItem.title
        }
    }
    
}

class HeaderHotFestaCell: UICollectionReusableView {
    static let id = "HeaderHotFestaCell"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(title: nil)
    }
    
    func prepare(title: String?) {
        self.titleLabel.text = title
    }
}
