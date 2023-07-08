//
//  CalculatorHeaderCell.swift
//  CalculatorClone
//
//  Created by Gonzalo Campos on 05/07/23.
//

import UIKit

class CalculatorHeaderCell: UICollectionReusableView {
    static let identifier = "CalculatorHeaderCell"

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 72, weight: .regular)
        label.text = "Title"
        return label
    }()

    public func configure(_ currentCalculatorText: String) {
        self.label.text = currentCalculatorText
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    private func setupUI() {
        self.backgroundColor = .black
        self.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("Unimplemented")
    }
}
