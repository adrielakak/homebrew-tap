cask "gravitynotch" do
  version "1.2.15"
  sha256 "ef22cba3fd637f738f3f0a30f71c9da7b19f3b0a0177a57168f0e35ba03ef778"

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
