cask :v1 => 'sql-developer' do
  version '4.1.1.19.59'
  sha256 '84e6057e1a2e00ce0df4478bdd9a04afe3e77a3ec00f52427b4a5ce7a9b18656'
  url "http://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-#{version}-macosx.app.zip",
      :cookies => {
                    'oraclelicense' => 'accept-sqldev-cookie'
                  },
      :referrer => 'http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html'

  homepage 'http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html'
  license :unknown

  app 'SQLDeveloper.app'

  caveats <<-EOS.indent

    DOES NOT WORK

  EOS
end
