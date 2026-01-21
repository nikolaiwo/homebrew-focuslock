cask "focuslock" do
  version "1.0.0"
  sha256 "29055d5785bad48a36f850c770a5c0efda07a3aba74b08755a5a49f0e11cb379"

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
