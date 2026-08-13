class Brcode < Formula
  desc "BharatRouter Code — a coding agent on GLM through BharatRouter"
  homepage "https://bharatrouter.com/code"
  # Pin the IMMUTABLE versioned artifact, not the rolling /cli/brcode — the
  # unversioned URL is rewritten by every deploy, which invalidates the pinned
  # sha and breaks `brew install`. Published by the site's build:done hook.
  url "https://bharatrouter.com/cli/brcode-0.5.6", using: :nounzip
  version "0.5.6"
  sha256 "ad3b74deec0d56859089ad8f25aaa50dd87e6feaee9999f6404cd00365508bf2"
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
