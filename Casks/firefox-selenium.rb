cask :v1 => 'firefox-selenium' do
  version '34.0.5'
  sha256 'd8efa218818adf2211cad4162a515a7c2bbe4d3b9319e8eb981b5060c097fa75'

  url "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/#{version}/mac/en-GB/Firefox%20#{version}.dmg"
  homepage 'https://www.mozilla.org/en-GB/firefox'
  license :mpl
  tags :vendor => 'Mozilla'

  app 'Firefox.app'
end
