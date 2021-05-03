class HttpResponse
  attr_accessor :header
  attr_accessor :body

  def initialize(env)
    @header = env["headers"]
    @body = Body.new(env["body"])
  end

  def get_header(key)
    header[key.downcase.gsub("http_", "").gsub("_", "-")]
  end

  class Body
    attr_accessor :body

    def initialize(body)
      @body = body
    end

    def read
      body
    end

    def rewind
    end
  end
end
