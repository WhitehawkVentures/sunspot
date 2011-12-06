module Sunspot
  module Query
    class Spatial
      def initialize(field, lat, lng, options)
        @field, @lat, @lng, @options = field, lat, lng, options
      end

      def to_params
        params = {:sfield => @field.indexed_name, :fq => "{!geofilt}", :pt => "#{@lat},#{@lng}", :sort => "geodist() asc"}
        params[:d] = @options[:radius] if @options[:radius]
        params
      end

    end
  end
end

