class V2rayRules < Formula
  version "202505292213"

  url "https://github.com/Loyalsoldier/v2ray-rules-dat.git"

  bottle :unneeded

  depends_on "v2ray"

  resource "apple-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/apple-cn.txt"
    sha256 "ba1483fcb9388b218ff9a6fb23be7771ce126c88187c729148ec331a4d996b7d" # apple-cn.txt
  end
  resource "direct-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-list.txt"
    sha256 "441d5a9ee7966691628acd978dec6b10fc87c7ea0b12ff5150b48447585bada8" # direct-list.txt
  end
  resource "direct-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-tld-list.txt"
    sha256 "a6380967590affe870dde5ca6f73ce364f4db9bb6776d94e792adfbdfeafabf5" # direct-tld-list.txt
  end
  resource "geoip" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
    sha256 "7af272c1aff1fe7c6421a45ddfa551998d46dc27365a1366accefbe2d58f09e0" # geoip.dat
  end
  resource "geosite" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
    sha256 "cd98c87853c2199f17cefc646803fd3e6e83861c5f7f40e279d7b5b6325dcf04" # geosite.dat
  end
  resource "gfw" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/gfw.txt"
    sha256 "3124ac64aead1f3ea6c5c8122cb301572e5c873536c19d4917343c1dc8f4a203" # gfw.txt
  end
  resource "google-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/google-cn.txt"
    sha256 "c5e65b6c1010a0c772308903931fb1d1a91d96482eceefb06c96f0413aa349a8" # google-cn.txt
  end
  resource "greatfire" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/greatfire.txt"
    sha256 "fa52d6e817e6012c3d24336f471df3d5dd431d05a971b1376eb16cfb888de82c" # greatfire.txt
  end
  resource "proxy-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-list.txt"
    sha256 "810560903f89640d85ce58d90d30f5c98fbe98d71d4f6df479fe6028dd4a6edd" # proxy-list.txt
  end
  resource "proxy-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-tld-list.txt"
    sha256 "930d90d8480d87869594917c506f052da78904fd5d91526468006f0cc69881e3" # proxy-tld-list.txt
  end
  resource "reject-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/reject-list.txt"
    sha256 "ab67330cc65be368ca08d05e4cdfa0bb71619d887edc22584230b018966fc018" # reject-list.txt
  end
  resource "win-extra" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-extra.txt"
    sha256 "7e5ddf9bae65adff92ea0b4032e9edffe2953680b157ecbad6bc362373a6c27d" # win-extra.txt
  end
  resource "win-spy" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-spy.txt"
    sha256 "8e9030eeb451e7d51b85f70c0753a7d5f30cf2fb44ade9c1a2345d60106f9033" # win-spy.txt
  end
  resource "win-update" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-update.txt"
    sha256 "f9e53c0dbd816ac5c20606f9cff5052c3de8818f34a264c1820ae305fd947896" # win-update.txt
  end

  def install
    resource("apple-cn").stage do
      pkgshare.install "apple-cn.txt"
    end
    resource("direct-list").stage do
      pkgshare.install "direct-list.txt"
    end
    resource("direct-tld-list").stage do
      pkgshare.install "direct-tld-list.txt"
    end
    resource("geoip").stage do
      pkgshare.install "geoip.dat"
    end
    resource("geosite").stage do
      pkgshare.install "geosite.dat"
    end
    resource("gfw").stage do
      pkgshare.install "gfw.txt"
    end
    resource("google-cn").stage do
      pkgshare.install "google-cn.txt"
    end
    resource("greatfire").stage do
      pkgshare.install "greatfire.txt"
    end
    resource("proxy-list").stage do
      pkgshare.install "proxy-list.txt"
    end
    resource("proxy-tld-list").stage do
      pkgshare.install "proxy-tld-list.txt"
    end
    resource("reject-list").stage do
      pkgshare.install "reject-list.txt"
    end
    resource("win-extra").stage do
      pkgshare.install "win-extra.txt"
    end
    resource("win-spy").stage do
      pkgshare.install "win-spy.txt"
    end
    resource("win-update").stage do
      pkgshare.install "win-update.txt"
    end
  end
end
