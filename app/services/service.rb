# frozen_string_literal: true

# Service contains what is shared by all services
class Service
  def self.call(params)
    new.call(params)
  end
end
