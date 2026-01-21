cask "focuslock" do
  version "1.0.1"
  sha256 "bc6d0f8ec311ccd121ae0070a4919945dec2460685fd215770eef08a82994f27"

  url "https://github.com/nikolaiwo/focus-lock/releases/download/v#{version}/FocusLock.zip"
  name "FocusLock"
  desc "Menu bar app that prevents blocked apps from stealing window focus"
  homepage "https://github.com/nikolaiwo/focus-lock"

  depends_on macos: ">= :ventura"

  app "FocusLock.app"

  postflight do
    # Clear quarantine flag for unsigned app
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/FocusLock.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.focuslock.app.plist",
  ]
end
