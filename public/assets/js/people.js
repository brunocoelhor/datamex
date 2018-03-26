$(document).ready(function(){

  var btn_search = $("#btn-search");
  var div_table = $("#div-table");
  var form_search = $("#form-search");
  var input_search = $("#input-search");

  $.ajax({ url: "ajax/people.php",
        context: document.body,
        type: 'GET',
        dataType: 'json',
        beforeSend: function(){
        },
        success: function(response){
          div_table.html(listPeople(response));
        }
  });

  function listPeople(people){
    var i=1;
    var table = `<table class='table table-striped table-bordered'>`;

    table += `<thead><tr><th>Nome</th><th>Número de Filhos</th></tr></thead>`;
    table += `<tbody>`;
    if(people == 'noresult'){
      table += `<tr>`;
      table += `<td class="warning" colspan="2">Nenhum registro foi encontrado</td>`;
      table += `</tr>`;
    }else{

      for (person of people) {
          table += `<tr>`;
          table += `<td>${person.nome}</td>`;
          table += `<td>${person.numfilhos}</td>`;
          table += `</tr>`;

          if (i >= 5) {
            table += `<tr>`;
            table += `<td class="warning" colspan="2" align=middle>Existem mais de 5 registros, refine a sua pesquisa</td>`;
            table += `</tr>`;
          break
        }
        i++;
      };
    }
    table += `</tbody>`;
    table += `</table>`;

    return table;
}

btn_search.on('click', function(){
  event.preventDefault();
  $.ajax({
    url: 'ajax/people.php',
    type: 'POST',
    data: form_search.serialize(),
    dataType: 'json',
    beforeSend: function(){

    },
    success: function(response){

      if(response == 'noresult'){
        div_table.html(listPeople(response));
      }else{
        div_table.html(listPeople(response));
      }

    }
  });
});

input_search.keypress(function(event){
	var keycode = (event.keyCode ? event.keyCode : event.which);
	if(keycode == '13'){
    $.ajax({
      url: 'ajax/people.php',
      type: 'POST',
      data: form_search.serialize(),
      dataType: 'json',
      beforeSend: function(){

      },
      success: function(response){
        if(response == 'noresult'){
          div_table.html(listPeople(response));
        }else{
          div_table.html(listPeople(response));
        }
      }
    });
	}

});


});
