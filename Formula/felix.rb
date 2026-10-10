class Felix < Formula
  desc "Deterministic, non-destructive web security auditing platform"
  homepage "https://github.com/jothish-blip/felix"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jothish-blip/felix/releases/download/v2.0.0/felix_2.0.0_darwin_arm64.tar.gz"
      sha256 "838bf0843c716263f22caa3c16ec2c77aab86a3b473a7fef37c6a528f4d05eaa"
    else
      url "https://github.com/jothish-blip/felix/releases/download/v2.0.0/felix_2.0.0_darwin_amd64.tar.gz"
      sha256 "c299de1ea5b9ed4d3b02db767e561bf82f9661132e98f6be8eebdc40e98796d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jothish-blip/felix/releases/download/v2.0.0/felix_2.0.0_linux_arm64.tar.gz"
      sha256 "fe5d29753b5418b7bc0111556696f8a0738a35e732952099909f6d78724142f4"
    else
      url "https://github.com/jothish-blip/felix/releases/download/v2.0.0/felix_2.0.0_linux_amd64.tar.gz"
      sha256 "1e3507a0081a7200d2d972f5cd9d73696942f331951847e877d6c0f82ac60b77"
    end
  end

  def install
    bin.install "felix"
  end

  test do
    assert_match "Felix Security Auditor", shell_output("#{bin}/felix version")
    assert_match "2.0.0", shell_output("#{bin}/felix version")
    assert_match "Usage:", shell_output("#{bin}/felix --help")
  end
end
