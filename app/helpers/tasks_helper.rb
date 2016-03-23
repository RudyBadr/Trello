module TasksHelper
	def task_errors!
		if @task.errors.any?
			sentence = I18n.t('errors.messages.not_saved',
				      count: @task.errors.count,
				      resource: @task.class.model_name.human.downcase)
			content_tag(:div,:class => "alert alert-danger") do
				concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
				concat content_tag(:h4,sentence) 
				concat content_tag(:ul,@task.errors.full_messages.map { |msg| content_tag(:li, msg) }.join('').html_safe)
			end
		end
	end
	def tasks!
		counter = 0;
		content_tag(:table,:class=>"table") do
			 content_tag(:thead,content_tag(:tr,content_tag(:th,"#")+content_tag(:th,"Name")+content_tag(:th,"Description")+content_tag(:th,"Action")))+
		     content_tag(:tbody) do
				@story.tasks.each do |task|
					concat content_tag(:tr,content_tag(:th,counter= counter+1,:scope=>"row")+content_tag(:td,task.name).html_safe+content_tag(:td,task.description).html_safe)
				end
			end
		end
	end
	def task_success!
		content_tag(:div,:class => "alert alert-success") do
			concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
			concat content_tag(:h4,"Story has been updated.") 
		end
	end
end
