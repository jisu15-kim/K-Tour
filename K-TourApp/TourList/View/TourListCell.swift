//
//  TourListCell.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/19.
//

import UIKit
import Kingfisher

class TourListCell: UITableViewCell {
    
    var model: Item?

    @IBOutlet weak var thumnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainAdress: UILabel!
    @IBOutlet weak var subAdress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10.0, left: 0, bottom: 10, right: 0))
    }
    
    func configure() {
        if let safeModel = model {
            titleLabel.text = safeModel.title
            mainAdress.text = safeModel.addr1
            subAdress.text = safeModel.addr2
            let imageUrl = URL(string: safeModel.firstimage)
            thumnailImage.kf.setImage(with: imageUrl)
            thumnailImage.layer.cornerRadius = 10
            thumnailImage.clipsToBounds = true
        }
    }
}
