class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  # Pin the IMMUTABLE versioned artifact, not the rolling /cli/brcode — the
  # unversioned URL is rewritten by every deploy, which invalidates the pinned
  # sha and breaks `brew install`. Published by the site's build:done hook.
  url "https://bharatrouter.com/cli/brcode-0.5.7", using: :nounzip
  version "0.5.7"
  sha256 "0c541a6ce1c7417c017763ad6193dc57da950a9e0a82f0ee76f038cc4207cc85"
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
