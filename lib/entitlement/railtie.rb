require 'entitlement/view_helpers'

module Entitlement
  class Railtie < Rails::Railtie
    initializer 'entitlement.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
