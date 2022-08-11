# frozen_string_literal: true

class DealSection < ApplicationRecord
  include ActionView::RecordIdentifier

  after_initialize :set_default_values
  before_create :set_default_values

  acts_as_list scope: :deal, sequential_updates: false

  scope :ordered, -> { order(:position) }

  belongs_to :deal
  belongs_to :section

  after_create_commit :broadcast_create
  after_update_commit :broadcast_update

  def name
    "#{section.name} - #{heading}"
  end

  private

  def broadcast_create
    partial = 'admin/editor/deal_sections/deal_section'
    locals = { deal_section: self }
    target = 'deal_sections_preview'
    broadcast_append_to(deal, :deal_sections_preview, target:, partial:, locals:)
  end

  def broadcast_update
    broadcast_replace_to(deal, :deal_sections_preview, target: dom_id(self),
                         partial: 'admin/editor/deal_sections/deal_section',
                         locals: { deal_section: self })
  end

  def set_default_values
    case section&.name
    when 'text'
      self.preHeading ||= 'Isto é um texto antes do texto principal'
      self.heading ||= 'Texto principal'
      self.subHeading ||= 'Isto é um texto depois do texto principal'
      self.text ||= "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisi eu consectetur"
    when 'bio'
      self.preHeading ||= 'Isto é um texto antes do sobre mim'
      self.heading ||= 'Sobre mim'
      self.subHeading ||= 'Isto é um texto depois do sobre mim'
      self.text ||= "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisi eu consectetur"
      self.links ||= {}
    end
  end
end