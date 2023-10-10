class Uplink < Formula
  desc "Uplink CLI for Storj DCS"
  homepage "https://storj.io"
  version "1.89.5"
  license "AGPL-3.0-only"

  depends_on "git"
  depends_on "go" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/storj/storj/releases/download/v1.89.5/uplink_darwin_arm64.zip"
      sha256 "c13d15bb4fcd55e50bf33141f6be82a50be5c736433d0c52ddbed83998fcf983"

      def install
        bin.install "uplink"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/storj/storj/releases/download/v1.89.5/uplink_darwin_amd64.zip"
      sha256 "7ff8f904296d21b696a403b25810ee5628644e096cb7ee5c3d7c76eb2e4aecf8"

      def install
        bin.install "uplink"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/storj/storj/releases/download/v1.89.5/uplink_linux_amd64.zip"
      sha256 "4465ad54279a04e7c3b7281d2156cf15529ae526814d35d251eb4f6e1f0c554b"

      def install
        bin.install "uplink"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/storj/storj/releases/download/v1.89.5/uplink_linux_arm.zip"
      sha256 "c7ef56d8672bbbf9cec0ed9116417310c7b7e93d09a3a2d078896edf62201437"

      def install
        bin.install "uplink"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/storj/storj/releases/download/v1.89.5/uplink_linux_arm64.zip"
      sha256 "268e550dd40547e96cacf6cf943deb86da91acb4790b79446eb7b02092c71dd9"

      def install
        bin.install "uplink"
      end
    end
  end

  test do
    system "#{bin}/uplink version"
  end
end