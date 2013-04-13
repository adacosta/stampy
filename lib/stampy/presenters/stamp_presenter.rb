module Stampy
  module Presenters
    class StampPresenter
      def initialize(stamps)
        @stamps = stamps
      end

      def humanize
        @stamps.map { |name, count| humanize_stamp(name, count) } * ', '
      end

      private

      def humanize_stamp(stamp_name, stamp_count)
        case stamp_count
        when 1
          "1 #{stamp_name} cent stamp"
        else
          "#{stamp_count} #{stamp_name} cent stamps"
        end
      end
    end
  end
end