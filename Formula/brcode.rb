class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  url "https://bharatrouter.com/cli/brcode", using: :nounzip
  version "0.2.0"
  sha256 "d464aa35df8351a8e46405f08c14eb65a457e4d85ac3035c91a7fe48b8425dcf"
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
