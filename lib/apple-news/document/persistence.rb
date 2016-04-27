module AppleNews
  class Document
    module Persistence
      extend ActiveSupport::Concern

      included do
        def save!
          
        end
      end
    end
  end
end
