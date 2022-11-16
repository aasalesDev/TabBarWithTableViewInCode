//
//  CustomTableViewCell.swift
//  NavigationControllerProgrammatically
//
//  Created by Anderson Sales on 16/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    static let identifier: String = "CustomTableViewCelle"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(imageName: String) {
        cellImage.image = UIImage(systemName: imageName)
    }
}
