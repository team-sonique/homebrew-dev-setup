class Tccutil < Formula
    url "https://github.com/jacobsalmela/tccutil/releases/download/v1.0/tccutil.py"
    version "1.0"
    homepage 'https://github.com/jacobsalmela/tccutil'
    sha256 "27dc4f07c0587bf826bc0d406a33284cb8551a46d2ed899f74c052a2e84f71cb"

    depends_on "python"

    def install
        bin.install "tccutil.py"
    end
end
