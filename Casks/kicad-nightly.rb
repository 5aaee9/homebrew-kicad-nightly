cask "kicad-nightly" do
  version "universal-20250825-0445-613db94679"
  sha256 "4db4b5279f17059a802d58d3e6d7288c4dfd0b8748e16e63b6234463d7de293a"

  url "https://downloads.kicad.org/kicad/macos/explore/nightlies/download/kicad-unified-#{version}.dmg",
      verified: "downloads.kicad.org/"
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
