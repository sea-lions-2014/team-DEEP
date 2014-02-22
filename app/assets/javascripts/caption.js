var Caption = {
  init: function() {
    $('form#new_caption').on('ajax:success', this.appendCaption)
  },

  appendCaption: function(event, data, status, xhr) {
    $('.captions').append(data);
    $('#caption_body').val('')
  }
}

$(document).ready(function(){
  Caption.init();
})

