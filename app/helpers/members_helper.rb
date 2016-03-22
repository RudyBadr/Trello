module MembersHelper
	def project_members_errors!
		if @project_member.errors.any?
			sentence = I18n.t('errors.messages.not_saved',
				      count: @project_member.errors.count,
				      resource: @project_member.class.model_name.human.downcase)
			content_tag(:div,:class => "alert alert-danger") do
				concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
				concat content_tag(:h4,sentence) 
				concat content_tag(:ul,@project_member.errors.full_messages.map { |msg| content_tag(:li, msg) }.join('').html_safe)
			end
		end
	end
	def project_members_self_error!
		sentence = I18n.t('errors.messages.not_saved',
				      count: "1",
				      resource: "project member".downcase)
		content_tag(:div,:class => "alert alert-danger") do
			concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
			concat content_tag(:h4,sentence) 
			concat content_tag(:ul,content_tag(:li, "You own this project").html_safe)
		end
	end
end
