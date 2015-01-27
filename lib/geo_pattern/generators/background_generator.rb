module GeoPattern
  module Generators
    class BackgroundGenerator
      private

      attr_reader :color, :seed

      public

      def initialize(seed, preset)
        @color = color_for(seed, preset)
      end

      def generate
        svg   = SVG.new
        svg.rect(0, 0, "100%", "100%", "fill" => color)

        svg
      end

      private

      def color_for(seed, preset)
        return PatternHelpers.html_to_rgb(preset.color) if preset.color?

        PatternHelpers.html_to_rgb_for_string(seed, preset.base_color)
      end
    end
  end
end
