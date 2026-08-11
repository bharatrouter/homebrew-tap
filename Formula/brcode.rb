class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  url "https://bharatrouter.com/cli/brcode", using: :nounzip
  version "0.5.2"
  sha256 "38930c364bcb51cdfe3adaada36320d7ebcecb8dfebafa6cd3b62c4393457a7c"
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
