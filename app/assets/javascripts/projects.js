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
            send_ajax("/projects/"+$('#project').attr('value')+"/stories/"+$(ui.item).find('input').val()+"/state",data);
        },
        over: function(e,ui){

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
        $('#storyModal').modal('show');
        $('.modal-title').html($(this).find('.story-title').text());
    });

    function send_ajax(url,data){
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
        });
    }
});
