//
//  UIView.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import UIKit

extension UIView {
@discardableResult
    func constraint(attribute: NSLayoutConstraint.Attribute,
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {return self}
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: attribute,
                                                   relatedBy: relation,
                                                   toItem: item ?? superview,
                                                   attribute: attribute,
                                                   multiplier: multiplier,
                                                   constant: constant ?? 0))
        return self
    }
@discardableResult
    func constraint(attributes: [NSLayoutConstraint.Attribute],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {return self}
        for attribute in attributes {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute,
                                                       multiplier: multiplier,
                                                       constant: constant ?? 0))
        }
        return self
    }
@discardableResult
    func constraint(attributesAttributes: [NSLayoutConstraint.Attribute:
                                            NSLayoutConstraint.Attribute],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {return self}
        for attribute in attributesAttributes {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute.key,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute.value,
                                                       multiplier: multiplier,
                                                       constant: constant ?? 0))
        }
        return self
    }
@discardableResult
    func constraint(attributesConstants: [NSLayoutConstraint.Attribute:
                                           CGFloat],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {return self}
        for attribute in attributesConstants {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute.key,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute.key,
                                                       multiplier: multiplier,
                                                       constant: attribute.value))
        }
        return self
    }
@discardableResult
    func height(constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
@discardableResult
    func width(constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
@discardableResult
    func shape(constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
}
