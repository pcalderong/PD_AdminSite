
$ ->
  $(document).on 'change', '#provincias_select', (evt) ->
    $.ajax 'update_cantones',
      type: 'GET'
      dataType: 'script'
      data: {
        provincia_id: $("#provincias_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
$ ->
  $(document).on 'change', '#cantones_select', (evt) ->
    $.ajax 'update_distritos',
      type: 'GET'
      dataType: 'script'
      data: {
        canton_id: $("#cantones_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
$ ->
  $(document).on 'change', '#padecimientos_select', (evt) ->
    $.ajax 'update_tipos_padecimientos',
      type: 'GET'
      dataType: 'script'
      data: {
        padecimiento_id: $("#padecimientos_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#provincias_select_report', (evt) ->
    $.ajax 'reports/update_cantones_report',
      type: 'GET'
      dataType: 'script'
      data: {
        provincia_id: $("#provincias_select_report option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
$ ->
  $(document).on 'change', '#cantones_select_report', (evt) ->
    $.ajax 'reports/update_distritos_report',
      type: 'GET'
      dataType: 'script'
      data: {
        canton_id: $("#cantones_select_report option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
$ ->
  $(document).on 'change', '#padecimientos_select_report', (evt) ->
    $.ajax 'reports/update_tipos_padecimientos_report',
      type: 'GET'
      dataType: 'script'
      data: {
        padecimiento_id: $("#padecimientos_select_report option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
