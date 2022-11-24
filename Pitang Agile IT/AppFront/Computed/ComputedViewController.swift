//
//  ComputedViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 25/08/1401 AP.
//

import UIKit

class ComputedViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .green
    }
    private func call(josicleison: Person) {
        if josicleison.podeSerPreso {
            print("\(josicleison.name) pode ser preso")
        }
        let button = UIButton()
        button.backgroundColor = .red
        view.addSubview(button)
        button.constraint([.centerX,.centerY])
        button.shape(size: view.width/4)
        let customView = UIView(frame: CGRect(origin: CGPoint(x: 0,
                                                              y: view.bottom-50),
                                              size: CGSize(width: view.width,
                                                           height: 50)))
        customView.backgroundColor = .white
        view.addSubview(customView)
        
        var employee = Employee(name: "Josicleison", annualSalary: 1000, weeksPerYear: 48, hoursPerDay: 7.5)
        print(employee.weeklySalary)
        print(employee.hourlyWage)
        employee.hourlyWage = 300
        print(employee.hourlyWage)
    }
}
