//
//  PickerViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 02/09/1401 AP.
//

import UIKit

final class PickerViewController: UIViewController, Setup {
// MARK: - variables
    private lazy var pickerView = PickerView(["a", "b", "c", "d", "e"])
    private lazy var datePicker = DatePicker()
    private lazy var textField = Create.textField(datePicker.dayMonthYear)
// MARK: - override
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - setup
    func setupView() {
//        pickerView.pickerViewDelegate = self
        datePicker.delegate = self
        datePicker.addTarget(self, action: #selector(datePickerTarget), for: .valueChanged)
        view.backgroundColor = .systemPurple
        view.addSubview(textField)
    }
    func setupConstraints() {
        textField.constraint(attributesConstants: [.leading: view.frame.width*0.2,
                                                   .trailing: -view.frame.width*0.2,
                                                   .centerY: 0])
    }
// MARK: - @objc func
    @objc func datePickerTarget(_ sender: UIDatePicker) {
        textField.text = datePicker.dayMonthYear
    }
}

extension PickerViewController: PickerViewDelegate, DatePickerDelegate {
    func datePicker(_ toolBar: UIToolbar) {
        textField.inputView = datePicker
        textField.inputAccessoryView = toolBar
    }
    func pickerView(_ toolBar: UIToolbar) {
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar
    }
    func pickerView(didSelect option: String) {
        textField.text = option
    }
    func done() {
        view.endEditing(true)
    }
}
