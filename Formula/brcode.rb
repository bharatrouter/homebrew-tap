class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  url "https://bharatrouter.com/cli/brcode", using: :nounzip
  version "0.5.0"
  sha256 "8b04407a735a61482ea400436b1ead7656df84e61d71f8f0c495cb113c05f409"
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
