class KubectlLoginPlugin < Formula
  desc "Kubectl Login Plugin"
  homepage ""
  version "1.5.29"
  url "http://repo.sns.sky.com:8081/artifactory/libs-releases/sky/dost/k8s/kubectl-login/kubectl-login-darwin-amd64-#{version}.tgz",
      :using => :nounzip
  sha256 "867e16e957e5ae04cf5df0d8db2caa2709d867ba878fdec425bd8dff48da446a"
  license ""

  def install
    system "tar", "xzf", "kubectl-login-darwin-amd64-#{version}.tgz"
    bin.install ".kube/kubectl-login/kubectl-login"
  end

end
