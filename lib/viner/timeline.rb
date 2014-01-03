module Viner
  class Timeline

    def self.tag(tag, page: nil, size: nil)
      raise NotImplementedError
    end

    def self.popular(page: nil, size: nil)
      raise NotImplementedError
    end

    def self.venues(venue, page: nil, size: nil)
      raise NotImplementedError
    end

  end
end
