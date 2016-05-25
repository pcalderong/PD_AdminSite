$("#cantones_select_report").empty()
  .append("<%= escape_javascript(render(:partial => 'canton')) %>")
