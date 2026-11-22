import Foundation

/// The names this copy of Strata keeps its own state under. The shipped app (`dev.strata.app`, and builds run outside
/// a bundle) uses the names it always has. A copy built under another bundle identifier (`scripts/build.sh` with
/// STRATA_BUNDLE_ID), running beside it, keeps its stores, caches, keychain key and themes apart, named after its
/// bundle, so neither reads or overwrites the other's.
nonisolated package enum AppStorageNames {
    package static let shippedIdentifier = "dev.strata.app"

    package static var identifier: String { Bundle.main.bundleIdentifier ?? shippedIdentifier }

    /// The folder in Application Support: Strata, or the bundle's name.
    package static var folderName: String {
        guard identifier != shippedIdentifier else { return "Strata" }
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? identifier
    }
}
