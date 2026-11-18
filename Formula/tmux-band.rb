class TmuxBand < Formula
  desc "Sidebar for Claude Code sessions in tmux: working, done, or waiting on you"
  homepage "https://github.com/suavesav/tmux-band"
  url "https://github.com/suavesav/tmux-band/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cfbfacd3a9d0946c737838b8c63fb058a1d6c0bcdb778216ee8bef360b8f76e8"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install "bin", "sidebar.mjs", "sidebar-core.mjs", "hooks.mjs", "tmux.conf", "install.sh", "VERSION"
    bin.install_symlink libexec/"bin/band"
    doc.install "docs/spec.html"
  end

  def caveats
    <<~EOS
      Finish the setup (copies the files to ~/.local/share/band and adds the
      hooks to your Claude Code settings; run it again after an upgrade):
        band install
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/band version").strip
  end
end
