module ProjectsHelper
	def project_errors!
		if @project.errors.any?
			html = <<-HTML
			    <div class="alert alert-danger">
			      <button type="button" class="close" data-dismiss="alert">x</button>
			      <h4>#{pluralize(@project.errors.count, 'error')}</h4>
			      <ul>
			      HTML

		       @project.errors.full_messages.each do |message| 
				    html +=  <<-HTML
					      	 	<li>
					      			#{message}
					      		</li>
					      	HTML
		       end
		    html += <<-HTML 
		    			</div>
		    		HTML
		    html.html_safe
		end
	end
end
