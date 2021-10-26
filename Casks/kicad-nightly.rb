cask "kicad-nightly" do
  version "20211025-170820-36d11f745e"
  sha256 "c444433551f13b99e01f8bf2f8f6cce4586aef8c97100e458fdd57ee06d3bf08"

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
