cask "kicad-nightly" do
  version "20211007-065627-57c7d663b0"
  sha256 "5a5cad3c095544fc0ffa52a7e5f0721c0b94731eb9a06df7daf54b16350d0960"

  url "https://kicad-downloads.s3.cern.ch/osx/nightly/kicad-unified-#{version}.dmg",
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
  artifact "kicad",          target: "/Library/Application Support/kicad/"

  uninstall rmdir: [
    "/Library/Application Support/kicad",
    "#{appdir}/KiCad",
  ]

  zap trash: "~/Library/Preferences/kicad"
end
