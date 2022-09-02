# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailValidator, type: :validator do
  subject(:validator) { described_class.new(attributes: { any: true }) }

  describe '#validate_each' do
    let(:errors) { ActiveModel::Errors.new(Struct.new(:foo)) }
    let(:record) do
      instance_double(ActiveModel::Validations, errors: errors)
    end

    context 'when valid email' do
      it 'does not increase error count' do
        expect do
          validator.validate_each(record, :email, 'test@example.com')
        end.not_to change(errors, :count)
      end
    end

    context 'when invalid email' do
      it 'increases the error count' do
        expect do
          validator.validate_each(record, :email, 'fakeemail')
        end.to change(errors, :count)
      end
    end
  end
end
