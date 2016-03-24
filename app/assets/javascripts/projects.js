
$(document).on('ready page:load',function(event){
    $('.docker').sortable({ 
        placeholder: "ui-sortable-placeholder" ,
        revert: false,
        zIndex: 9999,
        stop: function( event, ui ) {},
        start: function(e, ui){
            ui.placeholder.css("visibility", "visible");
        },
        stop: function(e,ui){
            var data = {state: $(this).parent().parent().attr('id')}
            send_ajax("/projects/"+$('#project').attr('value')+"/stories/"+$(ui.item).find('input').val()+"/state","POST",data);
        }
    }).disableSelection();
    $('.docker-item').draggable({
        cursor: 'move',
        scroll: false,
        connectToSortable: ".docker",
        revert: true,
        snap: false,
        
    });
    $('.docker-item').click(function(){
        send_ajax("/projects/"+$('#project').attr('value')+"/stories/"+$(this).find('input').val()+".js","GET",{});
        $('#storyModal').modal('show');
        $('#story_id').val($(this).find('input').val());
        $('#project_id').val($('#project').attr('value'));
        $('.modal-title').html($(this).find('.story-title').text());
        
    });
    function submit_task(){
    //alert('dasfas');
        var data = {story_id: $("#story_id").val(),name: $("#task_name").text(), description: $("task_description").text(),render_normal:"false"};
        send_ajax("/projects/"+$("#project_id").val()+"/stories/"+$("#story_id").val()+"/tasks.js","POST",data);
    }
    function send_ajax(url,method,data){
        $.ajax({
            url: url,
            type: method,
            data: data,
        });
    }
});
