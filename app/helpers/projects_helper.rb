module ProjectsHelper
	def project_errors!
		if @project.errors.any?
			sentence = I18n.t('errors.messages.not_saved',
				      count: @project.errors.count,
				      resource: @project.class.model_name.human.downcase)
			content_tag(:div,:class => "alert alert-danger") do
				concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
				concat content_tag(:h4,sentence) 
				concat content_tag(:ul,@project.errors.full_messages.map { |msg| content_tag(:li, msg) }.join('').html_safe)
			end
		end
	end
end
