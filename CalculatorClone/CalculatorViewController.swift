//
//  ViewController.swift
//  CalculatorClone
//
//  Created by Gonzalo Campos on 05/07/23.
//

import UIKit

class CalculatorViewController: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        setupUI()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
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
    }
}

// MARK: - Delegates
extension CalculatorViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as? ButtonCell else {
            fatalError("Failed to dequeue ButtonCell in CalculatorViewController")
        }
        cell.backgroundColor = .systemPurple
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/5.0, height: view.frame.size.width/5.0)
    }


}
