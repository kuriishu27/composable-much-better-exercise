//
//  File.swift
//
//
//  Created by Christian Leovido on 18/10/2021.
//

import Common
import ComposableArchitecture
import SnapshotTesting
import SwiftUI
import XCTest
@testable import BalanceFeature

final class BalanceUITests: XCTestCase {
  func testBalanceViewUIAmount() {
    let store = Store(
      initialState: .init(balance: "111.11"),
      reducer: balanceReducer,
      environment: .mock
    )

    let balanceView = UIHostingController(rootView: BalanceView(store: store))

    assertSnapshot(matching: balanceView, as: .image(on: .iPhoneXsMax))
  }

  func testBalanceWithErrorAlert() {
    var environment = BalanceEnvironment.mock
      environment.fetchBalance = {
        Effect(error: BalanceError.message("Error"))
      }
      let store = Store(
        initialState: .init(balance: "111.11"),
        reducer: balanceReducer,
        environment: environment
      )

    let balanceView = UIHostingController(rootView: BalanceView(store: store))

    assertSnapshot(matching: balanceView, as: .image(on: .iPhoneXsMax))
  }
}
