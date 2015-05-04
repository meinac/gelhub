$(document).ready(function() {

  $('#keywords-holder').tagsInput({
    'defaultText' : 'comma delimited keywords',
    'delimiter' : [','],
    'removeWithBackspace' : true,
    'placeholderColor' : '#999',
    'width' : '630px',
    'minInputWidth' : '200px'
  });

  var fetchButton = $('#fetch-repo-button');
  fetchButton.click(function() {
    repo = $('input[name="repo"]').val();
    if(repo != "") {
      fetchButton.attr('disabled', true);
      fetchButton.html('Wait...');
      $('#form-data').fadeOut();
      $.get($('input[name="fetch-repo-url"]').val() + '?repo=' + repo, function(data){
        $('#form-data').fadeIn();
        $('input[name="setting[repository_id]"]').val(data.id);
        $('#repo-name').html(data.full_name);
        $('#labels-area').html('');
        data.labels.forEach(function(label){
          $('#labels-area').prepend(
            '<div class="input-group" style="margin-top: 10px;"><span class="input-group-addon" style="width: 40px;"><input type="checkbox" name="setting[labels][]" value="' + label.name + '" /></span><div class="repo-label label-style-' + label.color + '" style="background-color: #' + label.color + '">' + label.name + '</div></div>'
          );
        });
        fetchButton.attr('disabled', false);
        fetchButton.html('Fetch');
      });
    }
  });

  $('#submit-setting').click(function(){
    $.each($('#keywords-holder').val().split(','), function(index, value){
      if(value.length > 0) {
        $('#keywords-area').prepend(
          '<input type="hidden" name="setting[keywords][]" value="' + value + '" />'
        );
      }
    });
  });
});