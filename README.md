
<div style="block: inline">
    <img alt="AppView for composable-much-better-exercise; Christian Ray Leovido" src="https://user-images.githubusercontent.com/18484997/137935353-07ccb47c-6bd3-4906-9bbf-4bc362f2d4ba.png" width="30%">
    <img alt="LoginView for composable-much-better-exercise; Christian Ray Leovido" src="https://user-images.githubusercontent.com/18484997/138886899-856f2c22-4c6c-4ac4-84a3-40e6fc4faa02.png" width="30%">
 </div>

# composable-much-better-exercise (TCA) [![Swift Version](https://img.shields.io/badge/swift-5.5-orange)](https://github.com/apple/swift) ![iOS version](https://img.shields.io/badge/iOS%20version-15.0-blue) ![architecture](https://img.shields.io/badge/architecture-TCA-brightgreen) ![Follow](https://img.shields.io/twitter/follow/c_leovido?style=social)

Simple finance iOS app.

## Technical overview
- [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture)
- Swift Package Manager
- Unit tests
- UI tests
- Modularisation


This is a project demonstrating the capabilities of [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture) and Swift Package Manager.
TCA allows developers to fully encapsulate state, actions and environment to control its side effects.

This allows for easier dependency management where we can have more control of what goes where when needed.

Compared to other ways of building and developing applications, TCA allows for building new **Features** in parallel in a big team.
Productivity increases while cognitive load stays at a manageable level.

## About 
The application logs in silently in the background requesting for a token that will be used to fetch the balance and transactions from the user.

## For developers running the code
To run the app.

1. Open the .xcworkspace file and Xcode will start fetching the dependencies. All you need to do is select "composable-much-better-exercise" scheme and run the app with a Simulator @ iOS 15.0.
2. Select the composable-much-better-exercise scheme and build/run.
2. To run all tests, select the AllTests scheme and CMD + U. More information about this on the MuchBetterDependencies README.md file.

## Features

- App
- Login
- Balance
- Transactions
- Spend

All features are isolated within their own components. 

These components are stored in folders here: [MuchBetterDependencies > Sources](https://github.com/kuriishu27/composable-much-better-exercise/tree/main/MuchBetterDependencies/Sources)


## Screenshots

<div style="block: inline">
    <img alt="AppView for composable-much-better-exercise; Christian Ray Leovido" src="https://user-images.githubusercontent.com/18484997/137920419-cac28727-659d-4881-a9ef-73773557716e.png" width="30%">
<img alt="AppView for composable-much-better-exercise; Christian Ray Leovido" src="https://user-images.githubusercontent.com/18484997/137920437-ad21c431-3da6-4ffa-ba8f-c4fb51f4e2cd.png" width="30%">
  
  <img alt="SpendView" src="https://user-images.githubusercontent.com/18484997/137920444-053aa9db-49de-4c52-a65e-6011e7761eb4.png" width="30%" >
  
  </div>
