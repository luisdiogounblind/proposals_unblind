class Section < ApplicationRecord
  has_many :deal_sections, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :section_category
  belongs_to :section_type

  def is_text?
    name == 'text'
  end

  def is_bio?
    name == 'bio'
  end

  def is_grid?
    name == 'grid'
  end

  def is_cabecalho?
    name == 'Cabeçalho'
  end

  def is_proposta?
    name == 'Proposta'
  end

  def is_contacto?
    name == 'Contacto'
  end

  def is_grelha?
    name == 'Grelha'
  end
end
