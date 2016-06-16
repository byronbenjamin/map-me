$(document).ready(function(){

  $('#modal').modal({
      show: false
  });

  //test for invoking it
  $('.add-trip').on('click', function(){

    $.ajax({
    method: 'GET',
    url: '/trips/new'
  })
  .done(function(response) {
    // console.log(response);
    $('#modal .modal-body').html(response);
    $('#modal').modal('show');
    });
  });

  $('.modal').on('submit', 'form', function(event) {
    event.preventDefault();
    console.log("IM IN there");

    $.ajax({
      method: 'POST',
      url: '/trips',
      data: $(this).serialize(),
      dataType: 'json',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
    })
    .done(function(response){
      console.log(response);
      addTripToMap(response);
      $('.trip-list').append("<p class='text-center'>" + response.name + "</p>");
      $('#modal').modal('hide');
    });
  });

});
