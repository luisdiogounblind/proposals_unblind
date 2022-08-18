# frozen_string_literal: true

module Admin
  module Editor
    class BioSection < DealSection
      def initialize(attributes = nil)
        attributes ||= {}
        attributes[:section_id] ||= 2
        attributes[:preHeading] ||= 'Isto é um texto antes da Biografia'
        attributes[:heading] ||= 'Biografia'
        attributes[:subHeading] ||= 'Isto é um texto depois da Biografia'
        attributes[:text] ||= 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisi eu consectetur'
        attributes[:links] ||= {}
        attributes[:theme] ||= {}
        attributes[:theme][:colors] ||= {}
        attributes[:theme][:colors][:background] ||= '#ffffff'
        attributes[:theme][:colors][:heading] ||= '#000000'
        attributes[:theme][:colors][:text] ||= '#000000'
        attributes[:theme][:colors][:button_background] ||= '#ffffff'
        attributes[:theme][:colors][:button_text] ||= '#000000'
        super(attributes)
      end
    end
  end
end
