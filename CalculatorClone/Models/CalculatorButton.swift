//
//  CalculatorButton.swift
//  CalculatorClone
//
//  Created by Gonzalo Campos on 05/07/23.
//

import UIKit

enum CalculatorButton {
    case allClear
    case plusMinus
    case percentage
    case divide
    case multiply
    case subtract
    case add
    case equals
    case number(Int)
    case decimal

    init(calcButton: CalculatorButton) {
        switch calcButton {
        case .number(let int):
            if int.description.count == 1 {
                self = calcButton
            } else {
                fatalError("CalculatorButton number Int is not 1 digit during inti")
            }
        default:
            self = calcButton
        }
    }
}

extension CalculatorButton {

    var title: String {
        switch self {
        case .allClear:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percentage:
            return"%"
        case .divide:
            return "/"
        case .multiply:
            return "x"
        case .subtract:
            return "-"
        case .add:
            return "+"
        case .equals:
            return "="
        case .number(let int):
            return int.description
        case .decimal:
            return "."
        }
    }

    var color: UIColor {
        switch self {
        case .allClear, .plusMinus, .percentage:
            return .lightGray
        case .divide, .multiply, .subtract, .add, .equals:
            return .systemOrange
        case .number, .decimal:
            return .darkGray
        }
    }

    var selectedColor: UIColor? {
        switch self {
        case .divide, .multiply, .subtract, .add:
            return .white
        default:
            return nil
        }
    }
}
