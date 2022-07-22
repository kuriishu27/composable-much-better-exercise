import Common
import ComposableArchitecture
import SnapshotTesting
import SwiftUI
import XCTest
@testable import TransactionFeature

final class TransactionUITests: XCTestCase {
  func testTransactionList_Empty() {
    var transactionEnvironment = TransactionEnvironment.mock
    transactionEnvironment.fetchTransactions = {
      Effect(value: [])
    }

    let store: Store<TransactionState, TransactionAction> = .init(
      initialState: .init(transactions: [], searchText: ""),
      reducer: transactionReducer,
      environment: transactionEnvironment
    )

    let transactionView = UIHostingController(rootView: TransactionView(store: store))

    assertSnapshot(matching: transactionView, as: .image(on: .iPhoneXsMax))
  }

  func testTransactionList_NonEmpty() {
    let store: Store<TransactionState, TransactionAction> = .init(
      initialState: .init(transactions: [], searchText: ""),
      reducer: transactionReducer,
      environment: TransactionEnvironment.mock
    )

    let transactionView = UIHostingController(rootView: TransactionView(store: store))

    assertSnapshot(matching: transactionView, as: .image)
  }
}
