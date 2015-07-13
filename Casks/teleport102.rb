cask :v1 => 'teleport102' do
  version '102'
  sha256 :no_check

  url 'http://www.abyssoft.com/software/teleport/downloads/teleport102.zip'
  name 'teleport'
  homepage 'http://www.abyssoft.com/software/teleport/'
  license :gratis

  prefpane 'teleport/teleport.prefpane'
end
