class SoniqueAntigen < Formula
  desc "A plugin manager for zsh, inspired by oh-my-zsh and vundle."
  homepage "http://antigen.sharats.me/"
  url "https://github.com/team-sonique/antigen/archive/master.tar.gz"
  sha256 "772826ce88a48c63bb8cd9fff152c2274272c4af44796900c4fa0f5f93cbc233"
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
