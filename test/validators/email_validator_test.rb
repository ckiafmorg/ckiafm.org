# frozen_string_literal: true

require 'test_helper'

class EmailValidable
  include ActiveModel::Validations

  attr_accessor :email

  validates :email, email: true
end

class EmailValidatorTest < ActiveSupport::TestCase
  test "quand email est valide il n'y a pas d'erreur d'ajoute" do
    validable = EmailValidable.new
    validable.email = 'test@ckiafm.org'

    is_valid = validable.valid?

    assert is_valid
    assert validable.errors[:email].blank?
  end

  test 'quand email est invalide une erreur est ajoutee' do
    validable = EmailValidable.new
    validable.email = 'invalidemail'

    is_valid = validable.valid?

    assert_not is_valid
    assert_equal I18n.t('validations.email_validator.invalid_email'), validable.errors[:email][0]
  end
end
