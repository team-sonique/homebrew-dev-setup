cask 'kubar' do
  version '2.2'
  sha256 :no_check

  url "https://git.sns.sky.com/jonathan.sharifi/kubar/raw/#{version}/binary/Kubar.dmg"
  homepage 'https://git.sns.sky.com/jonathan.sharifi/kubar/'

  app 'Kubar.app'
end
