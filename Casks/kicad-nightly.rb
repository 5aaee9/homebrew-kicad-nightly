cask "kicad-nightly" do
  version "universal-20230226-0235-c06cea2fe9"
  sha256 "0a62e7a50613176e7c1f40542eb1fa8c2d93b2a470f9c21bfff8d62ec8a74271"

  url "https://kicad-downloads.s3.cern.ch/osx/nightly/kicad-unified-#{version}.dmg",
      verified: "kicad-downloads.s3.cern.ch/"
  appcast "https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=osx/nightly/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  depends_on macos: ">= :catalina"

  suite "KiCad"
  artifact "demos", target: "/Library/Application Support/kicad/demos"

  zap trash: [
    "/Library/Application Support/kicad",
    "~/Library/Application Support/kicad",
    "~/Library/Preferences/kicad",
    "~/Library/Preferences/org.kicad-pcb.*",
    "~/Library/Saved Application State/org.kicad-pcb.bitmap2component.savedState",
    "~/Library/Saved Application State/org.kicad-pcb.eeschema.savedState",
    "~/Library/Saved Application State/org.kicad-pcb.kicad.savedState",
    "~/Library/Saved Application State/org.kicad-pcb.pcb_calculator.savedState",
    "~/Library/Saved Application State/org.kicad-pcb.pl_editor.savedState",
  ]
end
