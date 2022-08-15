# frozen_string_literal: true

pin 'application'
pin 'admin'

pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true

pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
# If we want to split controllers from admin controllers, simply extract
# `admin_controllers` in their own pin and load only the users visible
# controllers under controllers
pin_all_from 'app/javascript/controllers', under: 'controllers'
