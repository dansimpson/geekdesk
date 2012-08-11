 module Geekdesk 
  class Command

    Units = {
      "in"      => :in,
      "inch"    => :in,
      "inches"  => :in,
      "ft"      => :ft,
      "foot"    => :ft,
      "feet"    => :ft,
      "mm"      => :mm,
      "cm"      => :cm,
      "m"       => :m,
      "meter"   => :m,
      "meters"  => :m
    }

    attr_accessor :direction, :millimeters

    def initialize direction, amount, units

      @direction   = direction
      @millimeters = case units
      when :m 
        amount * 1000
      when :cm 
        amount * 10
      when :in 
        amount * 25.4
      when :ft 
        amount * 25.4 * 12
      else 
        amount
      end

    end

    def down?
      @direction == :down
    end

    def up?
      @direction == :up
    end

    # Create a Command object by parsing a string command
    # +text+ command to parse
    #
    # Examples:
    # down 2 inches
    # up 8 inches
    # down 2 mm
    # down 0.5 feet
    # uo 0.01 meters
    def self.parse text

      text.strip!
      text.downcase!

      fragments = text.split(/\s+/)
      if fragments.size < 3
        raise "Bad command, example: down 2 inches"
      end

      # Get direction
      direction = fragments.shift
      unless text.start_with? "down", "up"
        raise "Direction not detected"
      end

      # Get the number of units to move
      unless fragments.first =~ /^\d+$/
        raise "Epecting a number, not #{fragments.first}"
      end

      # Get the unit of movement
      amount = fragments.shift.to_f
      unless Units.key? fragments.first
        raise "Unknown unit of measure #{fragments.first}"
      end

      new direction.to_sym, amount.to_f, Units[fragments.shift]

    end

  end
end