require "pandago/version"
require "pandago/converter"
require "pandago/errors"

module Pandago
  BOUNDARY = "__X_PANDAGO_BOUNDARY_QYcwwbmfzj3rfKcMk7AWNw__"
  @@url = nil

  class << self
    def url
      @@url
    end

    def url=(url)
      @@url = URI(url)
      self.url
    end

    def convert(file, from:, to:)
      raise UrlNotSetError if url.nil?
      self::Converter.new(file, from, to, url).converted_content
    end
  end
end
