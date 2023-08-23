class V2rayRules < Formula
  version "202308232208"

  url "https://github.com/Loyalsoldier/v2ray-rules-dat.git"

  bottle :unneeded

  depends_on "v2ray"

  resource "apple-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/apple-cn.txt"
    sha256 "abfec68da7991285d03e855156c9bd85f449a19901bcdfa9e7273b8cdc279b0a" # apple-cn.txt
  end
  resource "direct-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-list.txt"
    sha256 "3e5e61e6adb3772c3b451a86c0eac284bf1211714ab6f1abc65c4b48cb126ae2" # direct-list.txt
  end
  resource "direct-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-tld-list.txt"
    sha256 "a36b2835b901edef6ca33caf9ccf842a478a910b676ab8232cba090bf3487068" # direct-tld-list.txt
  end
  resource "geoip" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
    sha256 "da0c2a17c98030c52243c9c07439c8d8ab1c90b2b06581efe0a70ee674ce96e9" # geoip.dat
  end
  resource "geosite" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
    sha256 "5fd96c3e49ac645a47d633f91047f139f48f0400ec3b795d1c1e18f38e1540cf" # geosite.dat
  end
  resource "gfw" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/gfw.txt"
    sha256 "3ac5d16061d9a80e0a00728d748e89093baf2db3897623ed8aa7685f0cad5d0a" # gfw.txt
  end
  resource "google-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/google-cn.txt"
    sha256 "b91a80237eb2e3e1e7416acda04f2b5920e85844d566dc6205e310f74e61567c" # google-cn.txt
  end
  resource "greatfire" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/greatfire.txt"
    sha256 "fa52d6e817e6012c3d24336f471df3d5dd431d05a971b1376eb16cfb888de82c" # greatfire.txt
  end
  resource "proxy-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-list.txt"
    sha256 "46a67b32a13159848d707e11aede819dce31527dec708962b40a9958a8008e86" # proxy-list.txt
  end
  resource "proxy-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-tld-list.txt"
    sha256 "bf10444bc8fa8581289ce64e58cfb8921b8134dad0b3b84c2b7e39a20e19014b" # proxy-tld-list.txt
  end
  resource "reject-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/reject-list.txt"
    sha256 "a9db20840c5470789e2feec57929d9cbf3c3008a5a7e092d33cd6549695806ec" # reject-list.txt
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
