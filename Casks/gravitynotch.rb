cask "gravitynotch" do
  version "1.2.8"
  sha256 "f45746451a0cce9701a36fb3011710a4e919752f02c6b8c0c2477071561a597e"

  url "https://github.com/adrielakak/GravityNotch/releases/download/gravitynotch-v#{version}/GravityNotch.dmg",
      verified: "github.com/adrielakak/GravityNotch/"
  name "GravityNotch"
  desc "Dynamic Island style control center for the notch"
  homepage "https://adrielakak.github.io/GravityNotch/"

  livecheck do
    url "https://adrielakak.github.io/GravityNotch/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "GravityNotch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/GravityNotch.app"],
                   must_succeed: false
  end

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
    GravityNotch is ad hoc signed and not notarized by Apple. This cask removes
    the quarantine attribute after install so the app can launch.

    On first launch, grant Accessibility access in
    System Settings > Privacy & Security > Accessibility.
  EOS
end
