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

	def add_project_member!
		content_tag(:div, class:"col-sm-3 col-md-3", id: "user_#{@user.id}") do
			content_tag(:div, class:"thumbnail") do
				content_tag(:img, image_tag(@user.avatar.url, wdith: "100%")) +
				content_tag(:div, content_tag(:h3, "#{@user.first_name} #{@user.last_name} <br/><small> #{@user.email} </small>".html_safe ) +content_tag(:p, link_to('Remove', project_member_url(@project_member.project.id,@project_member.id),:class => "btn btn-danger", role: "button", :style=>"width:100%", remote: :true, method: :delete)), class:"caption")
			end
		end
	end
	def list_project_members!
		content_tag(:div) do
			@project.project_members.each do |member|
				concat content_tag(:div, class:"col-sm-3 col-md-3", id: "user_#{member.user.id}") do
					content_tag(:div,content_tag(:img, image_tag(member.user.avatar.url, wdith: "100%")) +content_tag(:div, content_tag(:h3, "#{member.user.first_name} #{member.user.last_name}") +content_tag(:small, "#{member.user.email} ") +content_tag(:p, link_to('Remove', project_members_url(:project_id => member.project.id,:user_id => member.id),:class => "btn btn-danger", role: "button", :style=>"width:100%", remote: :true, method: :delete), class:"caption"), class:"thumbnail"))
				end
			end
		end
	end
	def list_users!
		content_tag(:div,"") do
			if @users.count > 0
				@users.each do |user|
					concat content_tag(:div,content_tag(:div,content_tag(:img,image_tag(user.avatar.url, width:"100", height: "100", style:"padding:5px;")), class: "col-lg-2")+
						 content_tag(:div,content_tag(:h4,"#{user.first_name}  #{user.last_name}")+content_tag(:br)+" #{user.email}",class:"col-lg-8")+
						 content_tag(:div,link_to('Add', project_members_url(:project_id => @project.id,:user_id => user.id),:class => "btn btn-primary", role: "button",:id=>"add-member", :style=>"width:100%", remote: :true, method: :post),class:"col-lg-2"),
						class:"row", id:"user_#{user.id}")
					#content_tag(:div,content_tag(:div, content_tag(:img,image_tag(user.avatar.url, width:"100", height: "100", style:"padding:5px;")), class: "col-lg-2") +content_tag(:div, content_tag(:h4,"#{user.first_name}")+content_tag(:br)+"#{user.last_name}") +content_tag(:div, link_to('Add', project_members_url(:project_id => @project.id,:user_id => user.id),:class => "btn btn-primary", role: "button",:id=>"add-member", :style=>"width:100%", remote: :true, method: :post), :id => "user_#{user.id}")
				end
			else
				concat content_tag(:p,"No Users found")
			end
		end
	end
end