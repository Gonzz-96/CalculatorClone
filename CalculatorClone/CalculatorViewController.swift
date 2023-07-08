//
//  ViewController.swift
//  CalculatorClone
//
//  Created by Gonzalo Campos on 05/07/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    let viewModel: CalculatorViewModel

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.register(CalculatorHeaderCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CalculatorHeaderCell.identifier)
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        return collectionView
    }()

    init(_ viewModel: CalculatorViewModel = CalculatorViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension CalculatorViewController {
    private func setupUI() {
        self.view.addSubview(collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

// MARK: - Delegates
extension CalculatorViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.calcButtonCells.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as? ButtonCell else {
            fatalError("Failed to dequeue ButtonCell in CalculatorViewController")
        }
        let calculatorButton = self.viewModel.calcButtonCells[indexPath.row]
        cell.configure(with: calculatorButton)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let calculatorButton = self.viewModel.calcButtonCells[indexPath.row]
        switch calculatorButton {
        case .number(let int) where int == 0:
            return CGSize(width: (view.frame.width/5.0) * 2 + ((view.frame.size.width/5.0) / 3.0),
                          height: view.frame.size.width/5.0)
        default:
            break
        }
        return CGSize(width: view.frame.size.width/5.0, height: view.frame.size.width/5.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (self.view.frame.width / 5) / 3
    }
}
