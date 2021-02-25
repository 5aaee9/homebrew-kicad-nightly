cask "kicad-nightly" do
  version "20210225-062753-a28cb98626"
  sha256 "8161e6722a19ba9bd9a180f5dd407c3a2200c76c01740d2e624b3c67966a72ad"

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
