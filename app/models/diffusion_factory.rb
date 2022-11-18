# frozen_string_literal: true

class DiffusionFactory
  def self.create_for(type, params)
    case type
    when :hebdomadaire
      DiffusionHebdomadaire.new(params)
    when :deux_semaines
      DiffusionDeuxSemaines.new(params)
    when :mensuelle
      DiffusionMensuelle.new(params)
    when :speciale
      DiffusionSpeciale.new(params)
    else
      raise 'Unable to create diffusion'
    end
  end
end
