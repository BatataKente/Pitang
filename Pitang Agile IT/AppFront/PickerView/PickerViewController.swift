//
//  PickerViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 02/09/1401 AP.
//

import UIKit

class PickerViewController: UIViewController, Setup {
// MARK: - Variables
    private let picker: (view: UIPickerView, options: [String]) = {
        let pickerView = UIPickerView()
        return (view: pickerView, options: ["a", "b", "c", "d", "e"])
    }()
    private let textField: UITextField = {
        let textField = Create.textField("batata")
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain,
                                     target: PickerViewController.self, action: #selector(done))
        toolBar.setItems([spaceButton, button], animated: false)
        textField.inputAccessoryView = toolBar
        return textField
    }()
// MARK: - Overrides
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - Setup
    func setupView() {
        textField.inputView = picker.view
        picker.view.dataSource = self
        picker.view.delegate = self
        view.backgroundColor = .systemPurple
        view.addSubview(textField)
    }
    func setupConstraints() {
        textField.constraint(attributesConstants: [.leading: view.frame.width*0.2,
                                                   .trailing: -view.frame.width*0.2,
                                                   .centerY: 0])
    }
// MARK: - @objc Funcs
    @objc func done() {
        view.inputViewController?.dismissKeyboard()
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker.options[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = picker.options[row]
    }
}
