//
//  File.swift
//
//
//  Created by Christian Leovido on 12/10/2021.
//

import BalanceFeature
import Client
import Common
import ComposableArchitecture
import LoginFeature
import SpendFeature
import TransactionFeature

public struct AppState: Equatable {
    public var balanceState: BalanceState
    public var transactionState: TransactionState
    public var spendState: SpendState
    public var loginState: LoginState?

    public init(balanceState: BalanceState = .init(balance: ""),
                transactionState: TransactionState = .init(),
                spendState: SpendState = .init(),
                loginState: LoginState? = .init())
    {
        self.balanceState = balanceState
        self.transactionState = transactionState
        self.spendState = spendState
        self.loginState = loginState
    }
}

public enum AppAction: Equatable {
    case balance(BalanceAction)
    case login(LoginAction)
    case spend(SpendAction)
    case transaction(TransactionAction)
}

public struct AppEnvironment {
    public var mainQueue: AnySchedulerOf<DispatchQueue>
    public var login: () -> Effect<String, Error>

    public init(mainQueue: AnySchedulerOf<DispatchQueue> = .main,
                login: @escaping () -> Effect<String, Error>)
    {
        self.mainQueue = mainQueue
        self.login = login
    }
}

public extension AppEnvironment {
    static let live: AppEnvironment = .init(login: {
        Client.shared.login()
            .eraseToEffect()
    })
    static let mock: AppEnvironment = .init(login: {
        Effect.fireAndForget {}
    })
}

public let appReducer: Reducer<AppState, AppAction, AppEnvironment> = .combine(
    loginReducer
        .optional()
        .pullback(
            state: \.loginState,
            action: /AppAction.login,
            environment: { _ in
                LoginEnvironment.mock
            }
        ),
    balanceReducer
        .pullback(
            state: \.balanceState,
            action: /AppAction.balance,
            environment: { _ in
                BalanceEnvironment.mock
            }
        ),
    transactionReducer
        .pullback(
            state: \.transactionState,
            action: /AppAction.transaction,
            environment: { _ in
                TransactionEnvironment.mock
            }
        ),
    spendReducer
        .pullback(
            state: \.spendState,
            action: /AppAction.spend,
            environment: { _ in
                SpendEnvironment.mock
            }
        )

).combined(with: Reducer<AppState, AppAction, AppEnvironment>({ state, action, _ in
    switch action {
    case .balance:
        return .none
    case let .login(loginAction):

        switch loginAction {
        case let .loginResponse(.success(newToken)):
            state.loginState = nil

            return .none
        default: return .none
        }
    case .spend:
        return .none
    case .transaction:
        return .none
    }
}))