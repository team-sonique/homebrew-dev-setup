class KubectlLoginPlugin < Formula
  desc "Kubectl Login Plugin"
  homepage ""
  version "1.5.43"
  url "http://artifactory.bmtapps.bskyb.com/artifactory/libs-releases/sky/dost/k8s/kubectl-login/kubectl-login-darwin-amd64-#{version}.tgz",
      :using => :nounzip
  sha256 "677bce351dbacb6b9d1d0a001d44fad7ad515c9fd272b0370604240cdb97cbc1"
  license ""

  def install
    system "tar", "xzf", "kubectl-login-darwin-amd64-#{version}.tgz"
    bin.install ".kube/kubectl-login/kubectl-login"
  end

end
