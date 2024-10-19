// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Plural format key: apples.count
  internal static func applesCount(_ p1: Int) -> String {
    return L10n.tr("LocalizableDict", "apples.count", p1)
  }
  /// Plural format key: competition.event.number-of-matches
  internal static func competitionEventNumberOfMatches(_ p1: Int) -> String {
    return L10n.tr("LocalizableDict", "competition.event.number-of-matches", p1)
  }
  /// Key: competition.tab.favorite-players
  internal static let competitionTabFavoritePlayers = L10n.tr("LocalizableDict", "competition.tab.favorite-players")
  /// Key: competition.tab.favorite-teams
  internal static let competitionTabFavoriteTeams = L10n.tr("LocalizableDict", "competition.tab.favorite-teams")
  /// Plural format key: feed.subscription.count
  internal static func feedSubscriptionCount(_ p1: Int) -> String {
    return L10n.tr("LocalizableDict", "feed.subscription.count", p1)
  }
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: StaticString, _ args: CVarArg...) -> String {
    return String(
      localized: key,
      defaultValue: defaultValue(key, args),
      table: table,
      bundle: BundleToken.bundle,
      locale: Locale.current
    )
  }

  private static func defaultValue(_ key: StaticString,
                                    _ args: CVarArg...) -> String.LocalizationValue {
    var stringInterpolation = String.LocalizationValue.StringInterpolation(literalCapacity: 0, interpolationCount: args.count)
    args.forEach { stringInterpolation.appendInterpolation(arg: $0) }
    return .init(stringInterpolation: stringInterpolation)
  }
}

private extension String.LocalizationValue.StringInterpolation {
  mutating func appendInterpolation(arg: CVarArg) {
    switch arg {
    case let arg as String: appendInterpolation(arg)
    case let arg as Int: appendInterpolation(arg)
    case let arg as UInt: appendInterpolation(arg)
    case let arg as Double: appendInterpolation(arg)
    case let arg as Float: appendInterpolation(arg)
    default: return
    }
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
// swiftlint:enable all
