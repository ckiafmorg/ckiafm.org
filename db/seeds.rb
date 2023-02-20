# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.new(email: 'test@ckiafm.org', password: '123456', password_confirmation: '123456').save(validate: false)
User.new(email: 'test', password: 'abc123', password_confirmation: 'abc123').save(validate: false)
