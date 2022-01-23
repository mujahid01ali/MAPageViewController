//
//  PageCollectionCell.swift
//  PageController
//
//  Created by Mujahid Ali on 23/01/22.
//

import UIKit

class PageCollectionCell: UICollectionViewCell {
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else {return}
            let attributedText = NSMutableAttributedString(string: unwrappedPage.text ?? "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.foregroundColor: UIColor(named: unwrappedPage.textColor ?? "") ?? .gray])
            attributedText.append(NSMutableAttributedString(string: "\n\n\(unwrappedPage.description ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor(named: unwrappedPage.descriptionColor ?? "") ?? .gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            guard let unwrappedImage = unwrappedPage.image else {return}
            imageViewLogo.image = UIImage(named: unwrappedImage)
        }
    }
    let topImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageViewLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Aligarh_Muslim_University_logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {

        
        addSubview(topImageViewContainer)
        topImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageViewContainer.addSubview(imageViewLogo)
        imageViewLogo.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        imageViewLogo.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        imageViewLogo.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
}
