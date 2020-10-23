module SharedScopes
  extend ActiveSupport::Concern

  included do
    scope #:today тобто користувачі створені сьогодні
  end
end
