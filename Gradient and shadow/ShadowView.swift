//
//  ShadowView.swift
//  Gradient and shadow
//
//  Created by Иван Дроботов on 01.02.2024.
//

import UIKit

final class ShadowView: UIView {
    
    var cornerRadius: CGFloat = 10.0 {
        didSet {
            gradientView.layer.cornerRadius = cornerRadius
        }
    }
    private let gradientView = GradientView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow()
    }
    
    private func style() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout() {
        addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 7.0
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        
        let cgPath = UIBezierPath(roundedRect: self.bounds,
                                  byRoundingCorners: [.allCorners],
                                  cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        self.layer.shadowPath = cgPath
    }
}
