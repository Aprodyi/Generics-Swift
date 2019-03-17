//
//  MyClass.swift
//  Test
//
//  Created by Aleksandr Sychev on 10/03/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

import Foundation

class Swifty {
	let a = 5
	let b = 10
	let c = 15

	func sum() -> Int {
		let d = a + b + c
		return d
	}
}

class SwiftyForObjectiveC : NSObject {
	private let internalSwifty = Swifty()

	@discardableResult
	@objc func sum() -> Int {
		return internalSwifty.sum()
	}

	func a() {

	}
}
