cask 'java8u181' do

  version '1.8.0_181'
  sha256 '3ea78e0107f855b47a55414fadaabd04b94e406050d615663d54200ec85efc9b'

  url 'https://github.com/team-sonique/homebrew-dev-setup/releases/download/2.0/jdk-8u181-macosx-x64.dmg'
  name 'Java Standard Edition Development Kit'
  homepage 'http://www.oracle.com/technetwork/java/javase/downloads/index.html'

  pkg "JDK 8 Update 181.pkg"

  postflight do
    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Add :JavaVM:JVMCapabilities: string BundledApp', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Info.plist"],
                   sudo: true
    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Add :JavaVM:JVMCapabilities: string JNI', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Info.plist"],
                   sudo: true
    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Add :JavaVM:JVMCapabilities: string WebStart', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Info.plist"],
                   sudo: true
    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Add :JavaVM:JVMCapabilities: string Applets', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Info.plist"],
                   sudo: true
    system_command '/bin/ln',
                   args: ['-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Home", '/Library/Java/Home'],
                   sudo: true
    system_command '/bin/mkdir',
                   args: ['-p', '--', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Home/bundle/Libraries"],
                   sudo: true
    system_command '/bin/ln',
                   args: ['-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Home/jre/lib/server/libjvm.dylib", "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents/Home/bundle/Libraries/libserver.dylib"],
                   sudo: true

    if MacOS.version <= :mavericks
      system_command '/bin/rm',
                     args: ['-rf', '--', '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'],
                     sudo: true
      system_command '/bin/ln',
                     args: ['-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents", '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'],
                     sudo: true
    end
  end

  uninstall pkgutil:   [
                         "com.oracle.jdk#{version.minor}u#{java_update}",
                         'com.oracle.jre',
                       ],
            launchctl: [
                         'com.oracle.java.Helper-Tool',
                         'com.oracle.java.Java-Updater',
                       ],
            quit:      [
                         'com.oracle.java.Java-Updater',
                         'net.java.openjdk.cmd', # Java Control Panel
                       ],
            delete:    [
                         '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin',
                         "/Library/Java/JavaVirtualMachines/jdk#{version.split('-')[0]}.jdk/Contents",
                         '/Library/PreferencePanes/JavaControlPanel.prefPane',
                         '/Library/Java/Home',
                         if MacOS.version <= :mavericks
                           [
                             '/usr/lib/java/libjdns_sd.jnilib',
                             '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK',
                           ]
                         end,
                       ].keep_if { |v| !v.nil? }

  zap       delete: [
                      '~/Library/Application Support/Java/',
                      '~/Library/Application Support/Oracle/Java',
                      '~/Library/Caches/com.oracle.java.Java-Updater',
                      '~/Library/Caches/Oracle.MacJREInstaller',
                      '~/Library/Caches/net.java.openjdk.cmd',
                      '~/Library/Preferences/com.oracle.java.Java-Updater.plist',
                      '~/Library/Preferences/com.oracle.java.JavaAppletPlugin.plist',
                      '~/Library/Preferences/com.oracle.javadeployment.plist',
                    ],
            rmdir:  '~/Library/Application Support/Oracle/'

  caveats <<-EOS
    This Cask makes minor modifications to the JRE to prevent issues with
    packaged applications, as discussed here:
      https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361
    If your Java application still asks for JRE installation, you might need
    to reboot or logout/login.
    Installing this Cask means you have AGREED to the Oracle Binary Code
    License Agreement for Java SE at
      https://www.oracle.com/technetwork/java/javase/terms/license/index.html
  EOS
end
