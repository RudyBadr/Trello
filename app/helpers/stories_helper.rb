module StoriesHelper
	def story_errors!
		if @story.errors.any?
			sentence = I18n.t('errors.messages.not_saved',
				      count: @story.errors.count,
				      resource: @story.class.model_name.human.downcase)
			content_tag(:div,:class => "alert alert-danger") do
				concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
				concat content_tag(:h4,sentence) 
				concat content_tag(:ul,@story.errors.full_messages.map { |msg| content_tag(:li, msg) }.join('').html_safe)
			end
		end
	end
	def stories!
		counter = 0;
		content_tag(:table,:class=>"table") do
			 content_tag(:thead,content_tag(:tr,content_tag(:th,"#")+content_tag(:th,"Name")+content_tag(:th,"Description")+content_tag(:th,"Action")))+
		     content_tag(:tbody) do
		     	
				@project.stories.each do |story|
					concat content_tag(:tr,content_tag(:th,counter= counter+1,:scope=>"row")+content_tag(:td,story.name).html_safe+content_tag(:td,story.description).html_safe+content_tag(:td,link_to("Add Task",new_project_story_task_url(:project_id=>@project.id, :story_id => @story.id),remote: true)))
				end
			end
		end
	end
	def story_success!
		content_tag(:div,:class => "alert alert-success") do
			concat content_tag(:button, "x", :type =>"button", :class =>"close", "data-dismiss" => "alert")
			concat content_tag(:h4,"Story has been updated.") 
			#concat content_tag(:ul,@project.errors.full_messages.map { |msg| content_tag(:li, msg) }.join('').html_safe)
		end
	end
	
end
