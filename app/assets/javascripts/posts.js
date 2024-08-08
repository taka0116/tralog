$(document).on('turbolinks:load', function() {
  $('#filter-links a').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    
    $.ajax({
      url: url,
      dataType: 'script', 
      success: function(data) {
        console.log('Ajax request succeeded');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log('Ajax request failed: ' + errorThrown);
      }
    });
  });
});
