Pod::Spec.new do |s|
    s.name      = "HelloAutomation"
    s.version   = ENV['LIB_VERSION']
    s.summary   = "HelloAutomation is a dummy pod for testing automation"
    s.homepage  = "https://github.com/NickKibish/HelloAutomation"
    s.license   = { :type => "MIT", :file => "LICENSE" }
    s.author    = { "Nick Kibish" => "nick.kibish@gmail.com" }
    s.source    = { :git => "https://github.com/NickKibish/HelloAutomation.git", :tag => "#{s.version}" }
    s.platform  = :ios, "16.0"

    s.source_files          = "Sources/HelloAutomation/**/*.{swift}"
    s.ios.deployment_target = "16.0"
    s.swift_version         = "5.8"
end