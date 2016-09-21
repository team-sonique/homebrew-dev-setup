class SoniqueAntigen < Formula
  desc "A plugin manager for zsh, inspired by oh-my-zsh and vundle."
  homepage "http://antigen.sharats.me/"
  url "https://github.com/team-sonique/antigen/archive/master.tar.gz"
  sha256 "614c9ee4517e5caa9912ff50e220e64626aa547e65f664ea41d76b3725c585bb"
  head "https://github.com/team-sonique/antigen.git"
  version "1.1.3"

  def install
    share.install "bin/antigen.zsh"
  end

  test do
    (testpath/".zshrc").write "source `brew --prefix`/share/antigen.zsh"
    system "/bin/zsh", "--login", "-i", "-c", "antigen help"
  end
end
