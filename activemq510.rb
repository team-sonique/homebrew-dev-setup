class Activemq510 < Formula
  desc "Apache ActiveMQ version 5.10.1"
  homepage "https://activemq.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=/activemq/5.10.1/apache-activemq-5.10.1-bin.tar.gz"
  sha256 "48193c0f2b8e126f9b386829d293e189287e8fe355f1bedc389150ce3e0fda68"

  depends_on :java => "1.6+"

  def install
    rm_rf Dir["bin/linux-x86-*"]
    libexec.install Dir["*"]
    (bin/"activemq").write_env_script libexec/"bin/activemq", Language::Java.java_home_env("1.6+")
    (bin/"activemq-admin").write_env_script libexec/"bin/activemq-admin", Language::Java.java_home_env("1.6+")
  end

  plist_options :manual => "activemq start"

  def plist; <<-EOS.undent
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
