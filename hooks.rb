#coding: utf-8

class QuickEditHooks < Redmine::Hook::ViewListener
	render_on :view_issues_context_menu_end, :partial=> 'hooks/context'
end
