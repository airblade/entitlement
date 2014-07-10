require 'entitlement/view_helpers'

module Entitlement
  class Railtie < Rails::Railtie
    initializer 'entitlement.view_helpers' do
      case Rails::VERSION::MAJOR
      when 3
        ActionView::Base.send :include, ViewHelpers
      when 4
        ActiveSupport.on_load :action_view do
          include ViewHelpers
        end
      else
        Rails.logger.warn "Entitlement doesn't support Rails #{Rails.version}."
      end
    end
  end
end
