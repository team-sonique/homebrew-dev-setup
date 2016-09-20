class SoniqueAntigen < Formula
  desc "A plugin manager for zsh, inspired by oh-my-zsh and vundle."
  homepage "http://antigen.sharats.me/"
  url "https://github.com/team-sonique/antigen/archive/master.tar.gz"
  sha256 "8ce1e05bd0f8a2a134b57bde560ba22681a7c40348cbef54cf6b92dad1464be4"
  head "https://github.com/team-sonique/antigen.git"
  version "1.1.2"

  def install
    share.install "antigen.zsh"
  end

  test do
    (testpath/".zshrc").write "source `brew --prefix`/share/antigen.zsh"
    system "/bin/zsh", "--login", "-i", "-c", "antigen help"
  end
end
