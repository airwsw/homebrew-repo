class V2rayRules < Formula
  version "202111182210"

  url "https://github.com/Loyalsoldier/v2ray-rules-dat.git"

  bottle :unneeded

  depends_on "v2ray"

  resource "apple-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/apple-cn.txt"
    sha256 "2dbad0b675042e4a0641a76105bb620f0218bf6f310747a500f29807b4b53130" # apple-cn.txt
  end
  resource "direct-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-list.txt"
    sha256 "4460d617a968975dd281d44c12e2b9d82efacd25437e40b8cec14cd79d5ae4e7" # direct-list.txt
  end
  resource "direct-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-tld-list.txt"
    sha256 "6586d9029edd42ca9d3e8a32d2d8c3aced37c9228615a5e693212b935a4d8efd" # direct-tld-list.txt
  end
  resource "geoip" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
    sha256 "b50b27098f2a4bb2e532e5e9f19143c793cd16e09531d753d77b25950e447e40" # geoip.dat
  end
  resource "geosite" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
    sha256 "83c428320c5722899b45eb32ce94ef96587eaff77590a858698db07df212ad91" # geosite.dat
  end
  resource "gfw" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/gfw.txt"
    sha256 "479f46cadc91c22d009e7d46168531684bf45d576025531844b0d9ad4931aef9" # gfw.txt
  end
  resource "google-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/google-cn.txt"
    sha256 "91676916544df024b0e559462addec5e5762cd7346fbb9a78461ab441cf7f98e" # google-cn.txt
  end
  resource "greatfire" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/greatfire.txt"
    sha256 "26a229eecab37a4d2744fe4b814a032fe4267106890d81287f9f58e680338c9a" # greatfire.txt
  end
  resource "proxy-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-list.txt"
    sha256 "6233b46e115cb9c8789d5808eba5d174b7d289d334c720cc5a1357470863ba11" # proxy-list.txt
  end
  resource "proxy-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-tld-list.txt"
    sha256 "8590a159c76481623718f9c383d18423bc6ffcc8542e5419c70802f34c891fcb" # proxy-tld-list.txt
  end
  resource "reject-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/reject-list.txt"
    sha256 "d686783e39097980e97635ddfb99cb2b44278c30d2dfa7547bb459165c365b24" # reject-list.txt
  end
  resource "win-extra" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-extra.txt"
    sha256 "ebe841e22b1517d21fb3ab6a5a1af14652682acfc01a572b8fa7a27e13c67804" # win-extra.txt
  end
  resource "win-spy" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-spy.txt"
    sha256 "a54a2ed96bb8dbc05b56ca6bd510bfcf27ff2bbb3f20e4416beea0fcaf58f6da" # win-spy.txt
  end
  resource "win-update" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-update.txt"
    sha256 "89009d840a0d317a552aa5505ad8c688180dfeb13a8b1bf82397699786e54814" # win-update.txt
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
