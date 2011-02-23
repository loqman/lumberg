module Lumberg
  module Whm
    class Args
      # Check the included hash for the included parameters.
      # Raises WhmArgumentError when it's mising the proper params
      #
      # ==== Example
      # 
      #    Args.new(options) do |c|
      #      c.requries  = [:user, :pass]
      #      c.booleans  = [:name]
      #      c.optionals = [:whatever]
      #    end
      def initialize(options)
        @required_params ||= []
        @boolean_params  ||= []
        @optional_params ||= []
        @options = options

        yield self 

        requires!
        booleans!
        valid_options!
      end

      def requires(*values)
        @optional_params.concat(values)
        @required_params = values
      end

      def booleans(*values)
        @optional_params.concat(values)
        @boolean_params = values
      end

      def optionals(*values)
        @optional_params.concat(values)
      end

      protected

      def requires!
        @required_params.each do |param| 
          if param.is_a?(Array)
            raise WhmArgumentError.new("Missing required parameter: #{param.first}") unless @options.has_key?(param.first) 
            raise WhmArgumentError.new("Required parameter cannot be blank: #{param.first}") if (@options[param.first].nil? || (@options[param.first].respond_to?(:empty?) && @options[param.first].empty?))
          else
            raise WhmArgumentError.new("Missing required parameter: #{param}") unless @options.has_key?(param) 
            raise WhmArgumentError.new("Required parameter cannot be blank: #{param}") if (@options[param].nil? || (@options[param].respond_to?(:empty?) && @options[param].empty?))
          end
        end
      end


      # Checks to see if supplied params (which are booleans) contain
      # either a 1 ("Yes") or 0 ("No") value.
      def booleans!
        @boolean_params.each do |param|
          if param.is_a?(Array)
            if @options.include?(param.first) && !@options[param.first].to_s.match(/(1|0)/)
              raise WhmArgumentError.new("Boolean parameter must be \"1\" or \"0\": #{param.first}")
            end
          else
            if @options.include?(param) && !@options[param].to_s.match(/(1|0)/)
              raise WhmArgumentError.new("Boolean parameter must be \"1\" or \"0\": #{param}")
            end
          end
        end
      end

      def valid_options!
        @options.keys.uniq.each do |key|
          raise WhmArgumentError.new("Not a valid parameter: #{key}") unless @optional_params.include?(key)
        end
      end  
    end
  end
end
