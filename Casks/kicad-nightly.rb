cask "kicad-nightly" do
  version "universal-20241104-0928-231fa952fb"
  sha256 "e81545fd5c4054835bb80ec4319001cccb80acb103484a2330c140de116e026e"

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
