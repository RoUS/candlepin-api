require('candlepin-api/base')

module CandlepinAPI

  module EntrypointExtensions

    attr_reader(:request_uri)
    attr_reader(:objtype)
    attr_accessor(:body)
    #
    # For Net::HTTP options
    #
    attr_accessor(:options)

    def is_response?
      return @objtype.eql?(:response)
    end
    def is_request?
      return (! self.is_response?)
    end

    #
    # An endpoint's to_s method returns just the path; an entrypoint's
    # includes the HTTP method (verb) involved.
    #
    def to_s
      return '%s %s' % [ self.verb.to_s.upcase, super ]
    end                         # End of def to_s

    #
    # Provide access to the path and query parameters through
    # indexing.  Path parameters are indexed as symbols, query
    # parameters as strings.
    #
    def find_param(key_p)
      key = nil
      if (key_p.kind_of?(Symbol))
        key = self.class::PathMap[key_p]
      elsif (key_p.kind_of?(String))
        key = self.class::QueryMap[key_p]
      end
      return key
    end
    protected(:find_param)

    #
    # TODO: What about headers, and request vs. response?
    #
    def [](key_p)
      key = find_param(key_p)
      return nil if (key.nil?)
      return self.__send__(key.to_sym)
    end

    def []=(key_p, val_p)
      key = find_param(key_p)
      if (key.nil?)
        raise ArgumentError.new('unknown query or path parameter ' +
                                key_p.inspect +
                                " for class #{self.class.name}")
      end
      return self.__send__("#{key}=".to_sym, val_p.to_s)
    end

  end                           # End of CandlepinAPI::EntrypointExtensions module

end                             # End of module CandlepinAPI
