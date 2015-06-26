Redmine::Plugin.register :redrisk do
  name 'Redrisk plugin'
  author 'Role Software'
  description 'This is a risk plugin for Redmine'
  version '1.0.1'
  url 'https://github.com/rolesoft/redrisk'
  author_url 'http://rolesoft.com.br'

  project_module :risks do

    permission :view_risks, {:risks => [:index, :show]}
    permission :add_risk, {:risks => [:new, :create]}
    permission :edit_risk, {:risks => [:update, :edit]}
    permission :delete_risk, {:risks => [:destroy]}
  end

  menu :project_menu,
       :risks, { :controller => 'risks', :action => 'index' },
       :caption => :risk_menu, :after => :activity

end
