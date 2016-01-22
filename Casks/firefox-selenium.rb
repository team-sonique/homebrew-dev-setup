cask 'firefox-selenium' do
  version '42.0'
  sha256 '3b7cb95c658fd3ed564c5bcd9fabab641383ee0974aa6593958a5ecc2ce71cbe'

  url "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/#{version}/mac/en-GB/Firefox%20#{version}.dmg"
  homepage 'https://www.mozilla.org/en-GB/firefox'
  license :mpl
  tags :vendor => 'Mozilla'

  app 'Firefox.app'
end
