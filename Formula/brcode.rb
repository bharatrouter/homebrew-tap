class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  url "https://bharatrouter.com/cli/brcode", using: :nounzip
  version "0.3.0"
  sha256 "7da25b86b0117306cd5fb51f7f96b612708310e6f5c724c871c181de00b9dba2"
  license "MIT"

  depends_on "node" # brcode installs/runs the OpenCode engine via npm

  def install
    bin.install "brcode"
    bin.install_symlink "brcode" => "br"
  end

  test do
    assert_match "BharatRouter Code", shell_output("#{bin}/brcode --help")
  end
end
