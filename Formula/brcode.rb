class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  url "https://bharatrouter.com/cli/brcode", using: :nounzip
  version "0.4.1"
  sha256 "41e44e1d8301c1f7578a853def301e9d68cf47914b23b3892e046125f3d4c843"
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
