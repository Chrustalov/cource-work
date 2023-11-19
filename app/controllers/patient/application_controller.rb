# frozen_string_literal: true

class Patient
  class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :error, :warning
    layout 'patient/layouts/application'
  end
end
