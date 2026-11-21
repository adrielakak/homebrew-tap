cask "gravitynotch" do
  version "1.2.13"
  sha256 "c11939674fc36bde3123b8e6299443b6f744d356df96c8768c69e1ce97c16128"

  url "https://github.com/adrielakak/GravityNotch/releases/download/gravitynotch-v#{version}/GravityNotch.dmg"
  name "GravityNotch"
  desc "Dynamic Island style control center for the notch"
  homepage "https://adrielakak.github.io/GravityNotch/"

  livecheck do
    url "https://adrielakak.github.io/GravityNotch/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "GravityNotch.app"

  uninstall quit: "theboringteam.boringnotch"

  zap trash: [
    "~/Library/Application Support/boringNotch",
    "~/Library/Caches/GravityNotch",
    "~/Library/Caches/theboringteam.boringnotch",
    "~/Library/HTTPStorages/theboringteam.boringnotch",
    "~/Library/HTTPStorages/theboringteam.boringnotch.binarycookies",
    "~/Library/Preferences/theboringteam.boringnotch.plist",
    "~/Library/Saved Application State/theboringteam.boringnotch.savedState",
  ]

  caveats <<~EOS
    GravityNotch is open source and not notarized by Apple. If macOS blocks the
    first launch, open System Settings > Privacy & Security and click
    "Open Anyway", or run:
      xattr -cr #{appdir}/GravityNotch.app

    Then grant Accessibility access in
    System Settings > Privacy & Security > Accessibility.
  EOS
end
