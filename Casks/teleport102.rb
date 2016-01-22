cask 'teleport102' do
  version '102'
  sha256 "ac03a6e5623d86f5577e89844503a4a3bf7e0924e4297515c7e0d1cf28f92ff2"

  url 'http://www.abyssoft.com/software/teleport/downloads/teleport102.zip'
  name 'teleport'
  homepage 'http://www.abyssoft.com/software/teleport/'
  license :gratis
  depends_on :formula => 'tccutil'

  prefpane 'teleport/teleport.prefpane'

  postflight do
      system '/usr/bin/sudo', 'tccutil.py', '--insert', 'com.abyssoft.teleport'
      system '/usr/bin/sudo', 'tccutil.py', '--enable', 'com.abyssoft.teleport'
  end

  uninstall :script => { :executable => '/usr/local/bin/tccutil.py', :args => ['--remove', 'com.abyssoft.teleport'] },
            :pkgutil => 'com.abyssoft.teleport.*'

end
