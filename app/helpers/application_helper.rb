module ApplicationHelper
	def story_details!
		content_tag(:div,class:"content") do
			if @story.tasks.count==0
				concat content_tag(:p, "No tasks to be shown".html_safe)
			else
				content_tag(:ul) do
					@story.tasks.each do |task|
						if task.state == "done"
							concat content_tag(:li, "<input type=checkbox checked class=decorate-text project-id= #{task.story.project.id} story-id= #{task.story.id} task-id= #{task.id} onchange=check(this)><strong class=decorate-text>#{task.name}</strong><p class=decorate-text>#{task.description}</p></input>".html_safe)
						else
							concat content_tag(:li, "<input type=checkbox class=task-check project-id= #{task.story.project.id} story-id= #{task.story.id} task-id= #{task.id} onchange=check(this)><strong>#{task.name}</strong><p>#{task.description}</p></input>".html_safe)
						end
						 
					end
					
				end
			end
		end
	end
end
