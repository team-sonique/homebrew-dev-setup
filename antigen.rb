class Antigen < Formula
  desc "A plugin manager for zsh, inspired by oh-my-zsh and vundle."
  homepage "http://antigen.sharats.me/"
  url "https://github.com/team-sonique/antigen/archive/master.zip"
  sha256 "709cf77f3084919d4281c083ea415b194bcce1722029b3c6a6953cb659272e26"
  head "https://github.com/team-sonique/antigen.git"

  def install
    share.install "antigen.zsh"
  end

  test do
    (testpath/".zshrc").write "source `brew --prefix`/share/antigen.zsh"
    system "/bin/zsh", "--login", "-i", "-c", "antigen help"
  end
end
