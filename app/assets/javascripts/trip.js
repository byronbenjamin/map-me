$(document).ready(function(){

  $('#registration-modal').modal({
      show: false
  });

  //test for invoking it
  $('.register').on('click', function(){

    $.ajax({
    method: 'GET',
    url: '/users/new'
  })
  .done(function(response) {
    console.log(response);
    $('#registration-modal .modal-body').html(response);
    $('#registration-modal').modal('show');
    });
  });

  $('#login-modal').modal({
      show: false
  });

  $('.login').on('click', function(){

    $.ajax({
    method: 'GET',
    url: '/session/new'
  })
  .done(function(response) {
    console.log(response);
    $('#login-modal .modal-body').html(response);
    $('#login-modal').modal('show');
    });
  });

  // $('#login-modal').on('submit', 'form', function(event) {
  //   event.preventDefault();
  //   console.log("IM IN there login");
  //
  //   $.ajax({
  //     method: 'POST',
  //     url: '/session',
  //     data: $(this).serialize(),
  //     dataType: 'json',
  //     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
  //   })
  //   .done(function(response){
  //     console.log(response);
  //     $('.no-trips').html("");
  //     addTripToMap(response);
  //     $('.trip-list').append("<p class='text-center'>" + response.name + "</p>");
  //     $('#modal').modal('hide');
  //   })
  //   .fail(function(jqxhr, status, errorThrown) {
  //     $(".error_explanation").replaceWith(jqxhr.responseText);
  //   });
  // });

  $('#trip-modal').modal({
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
    $('#trip-modal .modal-body').html(response);
    $('#trip-modal').modal('show');
    });
  });

  $('#trip-modal').on('submit', 'form', function(event) {
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
      $('.no-trips').html("");
      addTripToMap(response);
      $('.trip-list').append("<p class='text-center'>" + response.name + "</p>");
      $('#trip-modal').modal('hide');
    })
    .fail(function(jqxhr, status, errorThrown) {
      $(".error_explanation").replaceWith(jqxhr.responseText);
    });
  });

});
