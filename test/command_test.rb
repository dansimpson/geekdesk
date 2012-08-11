require_relative "test_helper"

module Geekdesk

  describe Command do

    it "should construct with basic args" do
      command = Command.new :down, 5, :in
      command.millimeters.must_equal 5 * 25.4
      command.direction.must_equal :down
    end

    it "should know down" do
      command = Command.new :down, 5, :in
      command.down?.must_equal true
      command.up?.must_equal false
    end

    it "should know up" do
      command = Command.new :up, 5, :in
      command.up?.must_equal true
      command.down?.must_equal false
    end

    # Parsing commands

    it "should parse down" do
      Command.parse("down 5 inches").down?.must_equal true
    end

    it "should parse up" do
      Command.parse("up 5 inches").up?.must_equal true
    end

    it "should parse inches" do
      Command.parse("down 5 inches").millimeters.must_equal 5 * 25.4
      Command.parse("down 5 in").millimeters.must_equal 5 * 25.4
      Command.parse("down 1 inch").millimeters.must_equal 1 * 25.4
    end

    it "should parse feet" do
      Command.parse("down 1 foot").millimeters.must_equal 1 * 25.4 * 12
      Command.parse("down 2 feet").millimeters.must_equal 2 * 25.4 * 12
      Command.parse("down 1 ft").millimeters.must_equal 1 * 25.4 * 12
    end

    it "should parse meters" do
      Command.parse("down 1 meter").millimeters.must_equal 1000
      Command.parse("down 2 meters").millimeters.must_equal 2000
      Command.parse("down 1 m").millimeters.must_equal 1000
    end

  end
end