$: << File.dirname(__FILE__) + "/../lib/"
$: << File.dirname(__FILE__) + "/"

require "geekdesk"
require "minitest/pride"
require "minitest/autorun"
require "minitest/spec"

module Geekdesk
  class MockDevice
  end
end