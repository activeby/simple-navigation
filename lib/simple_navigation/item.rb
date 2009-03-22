module SimpleNavigation
  class Item
    attr_reader :key, :name, :url, :sub_navigation
    
    def initialize(key, name, url, html_options, sub_nav_block)
      @key = key
      @name = name
      @url = url
      @html_options = html_options
      if sub_nav_block
        @sub_navigation = ItemContainer.new
        sub_nav_block.call @sub_navigation
      end
    end
    
    def selected?(current_navigation)
      key == current_navigation
    end
    
    def selected_class(current_navigation)
      selected?(current_navigation) ? SimpleNavigation.config.selected_class : nil
    end
    
    def html_options(current_navigation)
      options = @html_options.dup
      options[:class] = [@html_options[:class], self.selected_class(current_navigation)].flatten.compact.join(' ')
      options.delete(:class) if options[:class].blank? 
      options
    end
        
  end
end