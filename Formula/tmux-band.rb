class TmuxBand < Formula
  desc "Sidebar for Claude Code sessions in tmux: working, done, or waiting on you"
  homepage "https://github.com/suavesav/tmux-band"
  url "https://github.com/suavesav/tmux-band/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "70617ed7199cb2773c44bee005cd81260ac48842d690e5fc5e92e560684cc093"
  license "MIT"

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

      Needs Node 18 or newer on your PATH (brew install node).
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/band version").strip
  end
end
