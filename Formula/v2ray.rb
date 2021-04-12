class V2ray < Formula
  url "https://github.com/v2fly/v2ray-core/archive/v4.37.2.tar.gz"
  sha256 "ece74b2f0e04d9cd487d1b4d79010f0269b6ee0742aaeb147979e5b97639ffa3"
  head "https://github.com/v2fly/v2ray-core.git"

  bottle :unneeded

  depends_on "go" => :build

  resource "apple-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/apple-cn.txt"
  end
  resource "direct-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-list.txt"
  end
  resource "direct-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/direct-tld-list.txt"
  end
  resource "geoip" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
  end
  resource "geosite" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
  end
  resource "gfw" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/gfw.txt"
  end
  resource "google-cn" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/google-cn.txt"
  end
  resource "greatfire" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/greatfire.txt"
  end
  resource "proxy-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-list.txt"
  end
  resource "proxy-tld-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/proxy-tld-list.txt"
  end
  resource "reject-list" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/reject-list.txt"
  end
  resource "win-extra" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-extra.txt"
  end
  resource "win-spy" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-spy.txt"
  end
  resource "win-update" do
    url "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/win-update.txt"
  end

  def install
    ldflags = "-s -w -buildid="
    execpath = libexec/name
    system "go", "env", "-w", "GO111MODULE=on"
    system "go", "env", "-w", "GOPROXY=https://goproxy.cn,direct"
    system "go", "build", *std_go_args, "-o", execpath,
                 "-ldflags", ldflags,
                 "./main"
    system "go", "build", *std_go_args,
                 "-ldflags", ldflags,
                 "-tags", "confonly",
                 "-o", bin/"v2ctl",
                 "./infra/control/main"
    (bin/"v2ray").write_env_script execpath,
      V2RAY_LOCATION_ASSET: "${V2RAY_LOCATION_ASSET:-#{pkgshare}}"

    pkgetc.install "release/config/config.json"

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

  plist_options manual: "v2ray -config=#{HOMEBREW_PREFIX}/etc/v2ray/config.json"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{bin}/v2ray</string>
            <string>-config</string>
            <string>#{etc}/v2ray/config.json</string>
          </array>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
        </dict>
      </plist>
    EOS
  end

  test do
    (testpath/"config.json").write <<~EOS
      {
        "log": {
          "access": "#{testpath}/log"
        },
        "outbounds": [
          {
            "protocol": "freedom",
            "tag": "direct"
          }
        ],
        "routing": {
          "rules": [
            {
              "ip": [
                "geoip:private"
              ],
              "outboundTag": "direct",
              "type": "field"
            },
            {
              "domains": [
                "geosite:private"
              ],
              "outboundTag": "direct",
              "type": "field"
            }
          ]
        }
      }
    EOS
    output = shell_output "#{bin}/v2ray -c #{testpath}/config.json -test"

    assert_match "Configuration OK", output
    assert_predicate testpath/"log", :exist?
  end
end
