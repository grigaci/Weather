# Weather app

Demo weather app. Fetches current weather data for a given latitude and longitude.

Uses [Open Weather Map](https://openweathermap.org) to get the weather data.
 
- [Architecture](#architecture)
- [Coding style](#coding-style) 
- [Dependencies](#dependencies) 
- [Requirements](#requirements)
- [Setup](#Setup)
- [Testing](#testing)

## Architecture

### Goals

- components should be decoupled; modularization.
- components should be easy to replace.
- components should be light, easy to test.

### SOLID Principles

### Coordinator

### Model View Presenter

### Network service

### Weather service

## Coding style

Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/).

### Naming conventions

For readbility reasons, the following type naming conventions are used:

- all protocols are suffixed with **Protocol**
- all entities(domain models) are suffied with **Entity**
- all presentation models are suffixed with **PresentationModel**
- classes in the same group should have the same prefix.


## Dependencies

### SnapshotTesting

**SnapshotTesting** is the only dependency for this project. It is needed in unit tests to snapshot `UIView` objects.

## Requirements

- iOS 12.0+
- Xcode 10.1+
- Swift 4.2+
- Carthage 0.31.2+
	- It can be installed via Homebrew `brew install carthage`

## Setup

- Open Terminal at the root project folder and run `carthage update --platform "iOS"`
- Open `Weather.xcodeproj`
- Adjust the signing information if needed.

## Testing

### Unit tests

### Shapshot tests

### UI tests