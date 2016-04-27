module AppleNews
  class Document
    module Metadata
      extend ActiveSupport::Concern

      included do
        def is_sponsored?
          @metadata['isSponsored']
        end
        alias_method :sponsored?, :is_sponsored?

        def is_sponsored=(val)
          @metadata['isSponsored'] = val
        end

        def is_preview?
          @metadata['isPreview']
        end
        alias_method :preview?, :is_preview?

        def is_preview=(val)
          @metadata['isPreview'] = val
        end

        def accessory_text
          @metadata['accessoryText']
        end

        def accessory_text=(val)
          @metadata['accessoryText'] = val
        end

        def links
          @metadata['links']
        end

        def links=(val)
          @metadata['links'] = val
        end
      end
    end
  end
end
