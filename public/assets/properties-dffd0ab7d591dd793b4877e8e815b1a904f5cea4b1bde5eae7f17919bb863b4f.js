function update_properties_div(game_id) {  
  jQuery.ajax({
    url: "/update_properties",
    type: "GET",
    data: {"game_id" : game_id},
    dataType: "html"
    success: function(data) {
      jQuery("#propertiesDiv").html(data);
    }
  });
}
