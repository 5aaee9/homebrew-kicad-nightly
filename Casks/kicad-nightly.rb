cask "kicad-nightly" do
  version "universal-20230718-0236-da1e82d57e"
  sha256 "166e68f0d02f1127f429d7a394457845365283f49dfa213919c9557d4eb50cc6"

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
