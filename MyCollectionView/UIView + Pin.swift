//
//  UIView + Pin.swift
//  MyCollectionView
//
//  Created by ali on 2023-10-20.
//

import Foundation
import UIKit

extension UIView{
    enum ConstraintMode{
        case equal
        case grOE // greater or equal
        case lsOE // less or equal
    }
    
    //MARK: - Pin left
    @discardableResult
    func pinLeft(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, constant: const)
    }
    
    @discardableResult
    func pinLeft(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, leadingAnchor, anchor, constant: const)
    }

    // MARK: - Pin right
    @discardableResult
    func pinRight(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinRight(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, trailingAnchor, anchor, constant: -1 * const)
    }
    
    // MARK: - Pin top
    @discardableResult
    func pinTop(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, topAnchor, otherView.topAnchor, constant: const)
    }
    
    @discardableResult
    func pinTop(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, topAnchor, anchor, constant: const)
    }
    
    // MARK: - Pin bottom
    @discardableResult
    func pinBottom(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, bottomAnchor, otherView.bottomAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinBottom(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, bottomAnchor, anchor, constant: -1 * const)
    }
    
    // MARK: - Pin center
    func pinCenter(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ){
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, constant:  const)
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, constant: const)
    }
    
    @discardableResult
    func pinXCenter(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, constant:  const)
    }
    
    @discardableResult
    func pinXCenter(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, centerXAnchor, anchor, constant:const)
    }
    
    @discardableResult
    func pinYCenter(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, constant:  const)
    }
    
    @discardableResult
    func pinYCenter(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, centerYAnchor, anchor, constant: const)
    }
    
    // MARK: - Pin height
    @discardableResult
    func pinHeight(
        to otherView: UIView,
        _ const: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        return pinConstraint(mode: mode,  heightAnchor, otherView.heightAnchor, mulitplier: const)
    }
    
    @discardableResult
    func pinHeight(
        to dimension: NSLayoutDimension,
        _ const: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, heightAnchor, dimension,  mulitplier: const)
    }
    
    // MARK: - Pin width
    @discardableResult
    func pinWidth(
        to otherView: UIView,
        _ const: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, widthAnchor, otherView.widthAnchor,  mulitplier: const)
    }
    
    @discardableResult
    func pinWidth(
        to dimension: NSLayoutDimension,
        _ const: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinConstraint(mode: mode, widthAnchor, dimension,  mulitplier: const)
    }
    
    // MARK: - Set height
    @discardableResult
    func setHeight(
        value const: Double,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinDimension(mode: mode, heightAnchor, constant: const)
    }
    
    // MARK: - Set width
    @discardableResult
    func setWidth(
        value const: Double,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint{
        pinDimension(mode: mode, widthAnchor, constant: const)
    }
    
    
    
    // MARK: - Private methods
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(
        mode: ConstraintMode,
        _ firstConstraint: AnyAnchor,
        _ secondConstraint: AnyAnchor,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode{
        case.equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: const)
        case.grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: const)
        case.lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: const)
        }
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinConstraint(
        mode: ConstraintMode,
        _ firstConstraint: NSLayoutDimension,
        _ secondConstraint: NSLayoutDimension,
        mulitplier: Double = 1
    ) -> NSLayoutConstraint {
        let mult = CGFloat(mulitplier)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode{
        case.equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: mult)
        case.grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: mult)
        case.lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: mult)
        }
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinDimension(
        mode: ConstraintMode,
        _ dimension: NSLayoutDimension,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode{
        case.equal:
            result = dimension.constraint(equalToConstant: const)
        case.grOE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case.lsOE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }
        result.isActive = true
        return result
    }
}
