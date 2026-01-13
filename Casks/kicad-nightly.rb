cask "kicad-nightly" do
  version "universal-20260112-1159-de912bdc9a"
  sha256 "7b2a3b536c57903c057a40ee74f92ca33f0784f716b876c51fb6e7c6fbb56aad"

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
