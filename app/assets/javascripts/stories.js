function check(ele){
	var state = '';
	if(ele.checked){
		state = 'done';
	}else{
		state = 'not done';
	}
    $.ajax({
        url: " /projects/"+ele.getAttribute('project-id')+"/stories/"+ele.getAttribute('story-id')+"/tasks/"+ele.getAttribute('task-id')+"/state.js",
        type: "post",
        data: {state: state},
    });
}
function submit_task(){
    //alert('dasfas');
        var data = { task: {story_id: $("#story_id").val(),name: $("#task_name").val(), description: $("#task_description").val()},render_normal:"false"};
        $.ajax({
	        url: "/projects/"+$("#project_id").attr('value')+"/stories/"+$("#story_id").val()+"/tasks.js",
	        type: "POST",
	        data: data,
	    });
    }
