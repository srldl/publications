function availablejournals() {
  alert("hei");
  var availableTags = ['Nature','Science','Cryosphere'];
  alert(availableTags);
  $("#tags").autocomplete({
     source: availableTags
  });
});
