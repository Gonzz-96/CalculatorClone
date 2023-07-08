//
//  ButtonCellCollectionViewCell.swift
//  CalculatorClone
//
//  Created by Gonzalo Campos on 05/07/23.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    static let identifier = "ButtonCell"

    private(set) var calculatorButton: CalculatorButton!

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .regular)
        label.text = "Error"
        return label
    }()

    public func configure(with calculatorButton: CalculatorButton) {
        self.calculatorButton = calculatorButton
        self.titleLabel.text = calculatorButton.title
        self.backgroundColor = calculatorButton.color

        switch calculatorButton {
        case .allClear, .plusMinus, .percentage:
            self.titleLabel.textColor = .black
        default:
            self.titleLabel.textColor = .white
        }

        self.setupUI()
    }

    private func setupUI() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        switch calculatorButton {
        case .number(let int) where int == 0:
            self.layer.cornerRadius = 36
            let extraSpace = self.frame.width - self.frame.height
            NSLayoutConstraint.activate([
                titleLabel.heightAnchor.constraint(equalToConstant: self.frame.height),
                titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width),
                titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -extraSpace),
            ])
        default:
            self.layer.cornerRadius = self.frame.size.width / 2
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
                titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            ])
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.removeFromSuperview()
    }
}
