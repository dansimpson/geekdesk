$: << File.dirname(__FILE__) + "/geekdesk/"

require "yaml"
require "gpio"

module Geekdesk
  Version = "0.1.0"


  class Control

    def initialize gpio
      @gpio = gpio
    end

    def calibrate
      Calibration.new(@gpio).run
    end

    def state
      # load state from yaml
    end

    def adjust command
    end

  end

end

require "command"
require "state"
require "calibration"
require "device"