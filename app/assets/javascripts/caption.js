var Caption = {
  init: function() {
    $('form#new_caption').on('ajax:success', this.appendCaption)
    this.voteBinder();
  },

  appendCaption: function(event, data, status, xhr){
    $('.captions').append(data);
    $('#caption_body').val('');
  },

  voteBinder: function(){
    $('.captions').on('click', '.vote-up', function(){
      $(this).on('ajax:success', function(event, data, status, xhr){
        $(this).parent().next().text(data.score)
      });
    })
  }
}

$(document).ready(function(){
  Caption.init();
})

