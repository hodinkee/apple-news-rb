module AppleNews
  class Document
    include Properties

    attr_accessor :id

    required_properties :identifier, :title
    required_property :layout, nil, Layout
    required_property :components, [], Component, :factory
    required_property :component_text_styles, {}, Style::ComponentText

    required_property :version, "1.1"
    required_property :language, "en"

    optional_property :advertising_settings, nil, Property::AdvertisingSettings
    optional_property :metadata, nil, Metadata
    optional_property :document_style, nil, Style::Document
    optional_property :text_styles, {}, Style::Text
    optional_property :component_layouts, {}, ComponentLayout
    optional_property :component_styles, {}, Style::Component
    optional_property :subtitle
  end
end
