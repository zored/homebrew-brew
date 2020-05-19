class ChromedriverServiceDebug < Formula
  desc "Debug Chromedriver as a service"
  homepage "https://chromedriver.chromium.org/"
  url "https://github.com/zored/homebrew-brew.git", :tag => "v1.0.4"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  def install
    bin.install "Formula/chromedriver-service/chromedriver-service-debug.sh"
  end

  plist_options :manual => "chromedriver --debug"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <dict>
            <key>SuccessfulExit</key>
            <false/>
          </dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>/usr/local/bin/chromedriver</string>
            <string>--debug</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>/var/log/#{plist_name}.err</string>
          <key>StandardOutPath</key>
          <string>/var/log/#{plist_name}.out</string>
        </dict>
      </plist>
    EOS
  end

  test do
    assert_match "a", "a"
  end
end
