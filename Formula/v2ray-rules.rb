class V2rayRules < Formula
  version "202605252255"

  url "https://github.com/Loyalsoldier/v2ray-rules-dat.git"

  bottle :unneeded

  depends_on "v2ray"

  resource "apple-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/apple-cn.txt"
    sha256 "750581627bf729a1a29965aa3c01b1012d0aad936d959aef95607aede3bff38f" # apple-cn.txt
  end
  resource "direct-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-list.txt"
    sha256 "9606f7f147d7cc81298b1853b38013fbc3cc468c031ceb6d213f675b02e92083" # direct-list.txt
  end
  resource "direct-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-tld-list.txt"
    sha256 "411166018c0a4b4a7e66c48204a03dc713bde7cc889835c9475c2a83b715b5f8" # direct-tld-list.txt
  end
  resource "geoip" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
    sha256 "d2e9f275b996c5cf676be7c7e402726e1ee415f45662d69edd649494ca4d1713" # geoip.dat
  end
  resource "geosite" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
    sha256 "70159e862a12daba3643be021650b6c349bc803112d2634527793dc6a4013f4d" # geosite.dat
  end
  resource "gfw" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/gfw.txt"
    sha256 "458fd38fabc5719ec978d0599285c3845acc712fd60e62eb6b65b77b61070b92" # gfw.txt
  end
  resource "google-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/google-cn.txt"
    sha256 "35f95e0c5172cf4afac90aa542a2809ca8c84706173ef363b8ad870d27e9fa06" # google-cn.txt
  end
  resource "greatfire" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/greatfire.txt"
    sha256 "653e4e785e2577a11f9680ef1b054d522b0ea3b352b4f984d3695de5a4c901a9" # greatfire.txt
  end
  resource "proxy-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-list.txt"
    sha256 "747e2771411a4d1ac6c5efe8d8ac441e7d035b153461ade4ab59964847134fe2" # proxy-list.txt
  end
  resource "proxy-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-tld-list.txt"
    sha256 "5a10605d83544230578d745ed99e168781bc9d978579e5de753c9ed0bf9b21c9" # proxy-tld-list.txt
  end
  resource "reject-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/reject-list.txt"
    sha256 "98ffd1521b5e093520a3d3a43ea4a9f41ec364820764ebe01f3fc166e2188cde" # reject-list.txt
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
