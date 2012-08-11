 module Geekdesk 
  class Device

    def initialize

      # @in = InputPin.new
      @control = GPIO::OutputPin.new(pin: 7)
      @down = GPIO::OutputPin.new(pin: 11)
      @up = GPIO::OutputPin.new(pin: 12)
      @in = GPIO::InputPut.new(pin: 13)

    end

    def up millis
      # toggle on
      usleep millis
    end

    def up millis
      # toggle on
      usleep millis
    end

  end
end