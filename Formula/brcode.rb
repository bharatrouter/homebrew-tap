class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  # Pin the IMMUTABLE versioned artifact, not the rolling /cli/brcode — the
  # unversioned URL is rewritten by every deploy, which invalidates the pinned
  # sha and breaks `brew install`. Published by the site's build:done hook.
  url "https://bharatrouter.com/cli/brcode-0.5.4", using: :nounzip
  version "0.5.4"
  sha256 "438a8117aad14107be7fe4b1a11f2ecc369d0c1925b20be21c893e24d5dee287"
  license "MIT"

  depends_on "node" # brcode installs/runs the OpenCode engine via npm

  def install
    # The download arrives named after the (versioned) URL basename — brcode-<version>,
    # not "brcode" — so install it under the canonical name.
    bin.install "brcode-#{version}" => "brcode"
    bin.install_symlink "brcode" => "br"
  end

  test do
    assert_match(/BharatRouter/i, shell_output("#{bin}/brcode --help"))
  end
end
