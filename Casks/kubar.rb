cask 'kubar' do
  version '2.1'
  sha256 'af9f484e05ed9ac6e174a72371c9ae9821f24d661189eb88326abfe23d4b9809'

  url "https://git.sns.sky.com/jonathan.sharifi/kubar/raw/#{version}/binary/Kubar.dmg"
  homepage 'https://git.sns.sky.com/jonathan.sharifi/kubar/'

  app 'Kubar.app'
end
