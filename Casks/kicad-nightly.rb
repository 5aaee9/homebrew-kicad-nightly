cask "kicad-nightly" do
  version "20210205-193410-2e12d0647b"
  sha256 "0427628bdd4efdbcd33e8e144904d13b498952ee42f476b2214789e290b82ea1"

  url "https://kicad-downloads.s3.cern.ch/osx/nightly/kicad-unified-#{version}-10_14.dmg",
      verified: "kicad-downloads.s3.cern.ch/"
  appcast "https://kicad-downloads.s3.cern.ch/?delimiter=/&prefix=osx/nightly/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  depends_on macos: ">= :mojave"

  app "KiCad/KiCad.app",              target: "KiCad/KiCad.app"
  app "KiCad/Bitmap2Component.app",   target: "KiCad/Bitmap2Component.app"
  app "KiCad/Eeschema.app",           target: "KiCad/Eeschema.app"
  app "KiCad/GerbView.app",           target: "KiCad/GerbView.app"
  app "KiCad/PCB Calculator.app",     target: "KiCad/PCB Calculator.app"
  app "KiCad/Pcbnew.app",             target: "KiCad/Pcbnew.app"
  app "KiCad/Page Layout Editor.app", target: "KiCad/Page Layout Editor.app"
  artifact "KiCad/share",             target: "/Applications/KiCad/share"
  artifact "kicad/3dmodels",          target: "/Library/Application Support/kicad/3dmodels"
  artifact "kicad/help",              target: "/Library/Application Support/kicad/help"
  artifact "kicad/library",           target: "/Library/Application Support/kicad/library"
  artifact "kicad/modules",           target: "/Library/Application Support/kicad/modules"
  artifact "kicad/template",          target: "/Library/Application Support/kicad/template"

  uninstall rmdir: [
    "/Library/Application Support/kicad",
    "#{appdir}/KiCad",
  ]

  zap trash: "~/Library/Preferences/kicad"
end
