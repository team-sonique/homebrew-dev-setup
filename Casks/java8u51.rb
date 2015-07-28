cask :v1 => 'java8u51' do
  version '1.8.0_51'
  sha256 '85ee66d1fdce5244afcbfbfce8dc90582b8c7e3ec8ab4c21e0f4eb390af97832'

  url 'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-macosx-x64.dmg',
      :cookies => {
                    'oraclelicense' => 'accept-securebackup-cookie'
                  }
  homepage 'http://www.oracle.com/technetwork/java/javase/downloads/index.html'
  license :unknown

  pkg 'JDK 8 Update 51.pkg'
  postflight do
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string BundledApp', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string JNI',        "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string WebStart',   "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/usr/libexec/PlistBuddy', '-c', 'Add :JavaVM:JVMCapabilities: string Applets',    "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Info.plist"
    system '/usr/bin/sudo', '-E', '--',
      '/bin/rm', '-rf', '--', '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'
    system '/usr/bin/sudo', '-E', '--',
      '/bin/ln', '-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents", '/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK'
    system '/usr/bin/sudo', '-E', '--',
      '/bin/mkdir', '-p', '--', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Home/bundle/Libraries"
    system '/usr/bin/sudo', '-E', '--',
      '/bin/ln', '-nsf', '--', "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Home/jre/lib/server/libjvm.dylib", "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk/Contents/Home/bundle/Libraries/libserver.dylib"
  end
  uninstall :pkgutil => 'com.oracle.jdk8u51',
            :delete => "/Library/Java/JavaVirtualMachines/jdk#{version}.jdk"

  caveats <<-EOS.undent
    This Cask makes minor modifications to the JRE to prevent any packaged
    application issues.

    If your Java application still asks for JRE installation, you might need to
    reboot or logout/login.

    The JRE packaging bug is discussed here:

        https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361

    Installing this Cask means you have AGREED to the Oracle Binary Code License
    Agreement for Java SE at

        http://www.oracle.com/technetwork/java/javase/terms/license/index.html

    EOS
end