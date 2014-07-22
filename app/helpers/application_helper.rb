#coding: utf-8

module ApplicationHelper
   def quick_edit_link(caption, target_field, field_type, disabled)
      help_message= l(:text_edit_confirm)

      case field_type.to_s
      when "string", "text"
         pattern = ''
      when "int"
         pattern = '\d+'
      when "date"
         pattern = '\d{4}-\d{2}-\d{2}'
         help_message += " (yyyy-mm-dd)"
      end

      pattern = h(pattern.gsub(/\\/,'\\\\\\\\'))

      sprintf('<li>%s%s</li>',
         context_menu_link(
            h(caption),
            "javascript:quick_edit_show_input_dialog('#{target_field}', '#{pattern}', '#{help_message}')",
            :class => 'icon-edit',
            :disabled => disabled
         ),
         context_menu_link(
            h(:dummy),
            '#',
            :id => 'context_edit_update_link_%s' % target_field.to_s().tr('[]','__'),
            :style=>'display:none',
            :method => :post,
         )
      ).html_safe()
   end   
end

