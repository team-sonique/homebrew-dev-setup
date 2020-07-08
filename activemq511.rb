class Activemq511 < Formula
  desc "Apache ActiveMQ version 5.11.4"
  homepage "https://activemq.apache.org/"
  url "http://archive.apache.org/dist/activemq/5.11.4/apache-activemq-5.11.4-bin.tar.gz"
  sha256 "a5af416775ffa40ef2b181e05011d8007494173475e62b2e3175b685098e5b29"

  depends_on :java => "1.6+"

  def install
    rm_rf Dir["bin/linux-x86-*"]
    libexec.install Dir["*"]
    (bin/"activemq").write_env_script libexec/"bin/activemq", Language::Java.java_home_env("1.6+")
    (bin/"activemq-admin").write_env_script libexec/"bin/activemq-admin", Language::Java.java_home_env("1.6+")
  end

  plist_options :manual => "activemq start"

  def plist; <<-EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{libexec}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/activemq</string>
          <string>start</string>
        </array>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/activemq-admin", "browse", "-h"
  end
end
