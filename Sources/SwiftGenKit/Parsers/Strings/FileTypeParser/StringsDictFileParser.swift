//
// SwiftGenKit
// Copyright © 2022 SwiftGen
// MIT Licence
//

import Foundation
import PathKit

extension Strings {
  final class StringsDictFileParser: StringsFileTypeParser {
    private let options: ParserOptionValues

    init(options: ParserOptionValues) {
      self.options = options
    }

    static let extensions = ["stringsdict"]

    func parseFile(at path: Path) throws -> [Strings.Entry] {
      guard let data = try? path.read() else {
        throw ParserError.failureOnLoading(path: path)
      }

      do {
        let plurals = try PropertyListDecoder()
          .decode([String: StringsDict].self, from: data)
          .compactMapValues { stringsDict -> StringsDict.PluralEntry? in
            // We only support .pluralEntry (and not .variableWidthEntry) for now, so filter out the rest
            guard case let .pluralEntry(pluralEntry) = stringsDict else { return nil }
            return pluralEntry
          }

        return try plurals.map { keyValuePair -> Entry in
          let (key, pluralEntry) = keyValuePair
          // We are taking "Other" rule, since its the only one that always should be there
          let translation = (pluralEntry.variables.first?.rule.other) ?? ""
          return Entry(
            key: key,
            formatKey: pluralEntry.formatKey,
            translation: translation,
            types: try PlaceholderType.placeholderTypes(
              fromFormat: pluralEntry.formatKeyWithVariableValueTypes
            ),
            keyStructureSeparator: options[Option.separator]
          )
        }
      } catch DecodingError.keyNotFound(let codingKey, let context) {
        throw ParserError.invalidPluralFormat(
          missingVariableKey: codingKey.stringValue,
          pluralKey: context.codingPath.first?.stringValue ?? ""
        )
      }
    }
  }
}
