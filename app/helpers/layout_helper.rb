module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def no_content_for(symbol)
    content_for(symbol) { '' }
  end
  
  def main_menu(active=nil)
    
    menu_options =  {:name => 'Home', :link => root_path}, 
                    {:name => 'Campaigns', :link => projects_path}, 
                    {:name => 'Our Mission', :link => page_path('mission')}, 
                    {:name => 'About', :link => page_path('about')},
                    {:name => 'weBlog', :link => "http://weblog.friendsofwe.org"}, 
                    {:name => 'Contact', :link => new_contact_path},
                    {:name => 'Volunteer', :link => page_path('get-involved')}
    
    menu_options.collect do |menu_option|
      html_class = ''
      html_class << 'active' if menu_option[:name] == active
      html_class << ' first' if menu_option[:name] == menu_options.first[:name]
      html_class << ' normal' if menu_option[:name] == 'weBlog'
      html_class = " class=\"#{html_class.strip}\"" unless html_class.empty?
     "<li#{html_class unless html_class.empty?}>#{link_to(content_tag(:span, menu_option[:name], :class => 'inner'), menu_option[:link])}</li>"
    end.compact.join("\n")
  end
  
  def content_class(content_class)
    " class=\"#{content_class}\"" 
  end
  
end
