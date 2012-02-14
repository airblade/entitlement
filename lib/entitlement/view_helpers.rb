module Entitlement
  module ViewHelpers

    def title(*args)
      if args.empty?
        render_title
      elsif args.first.is_a?(Hash)
        render_title args.first
      else
        tee *args
      end
    end

    def tee(*args)
      @page_title = args
      args.first.html_safe
    end

    private

    def render_title(options = {})
      defaults = {
        :separator => ' - ',
        :big_endian => false
      }
      options = defaults.merge options

      @page_title ||= []
      @page_title << options[:site] if options[:site]
      @page_title.reverse! if options[:big_endian]
      @page_title.join(options[:separator]).html_safe
    end

  end
end
