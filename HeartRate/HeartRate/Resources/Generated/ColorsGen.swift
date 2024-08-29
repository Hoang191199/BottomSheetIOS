// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorsGen {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f5ff"></span>
  /// Alpha: 100% <br/> (0xf5f5ffff)
  internal static let bgColor = ColorsGen(rgbaValue: 0xf5f5ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff3551"></span>
  /// Alpha: 100% <br/> (0xff3551ff)
  internal static let red = ColorsGen(rgbaValue: 0xff3551ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5896f7"></span>
  /// Alpha: 12% <br/> (0x5896f71f)
  internal static let shadowBlock = ColorsGen(rgbaValue: 0x5896f71f)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5896f7"></span>
  /// Alpha: 12% <br/> (0x5896f71f)
  internal static let shadowColor = ColorsGen(rgbaValue: 0x5896f71f)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000422"></span>
  /// Alpha: 100% <br/> (0x000422ff)
  internal static let textBlack = ColorsGen(rgbaValue: 0x000422ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff7222"></span>
  /// Alpha: 100% <br/> (0xff7222ff)
  internal static let textOrange = ColorsGen(rgbaValue: 0xff7222ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map { CGFloat($0 & 0xff) }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorsGen) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
