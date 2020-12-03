const collapseDayBoxes = () => {

  var coll = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      // debugger
      console.log(content)
      if (content.style.display === "flex") {
        content.style.display = "none";
      } else {
        content.style.display = "flex";
      }
    });
  }
}

const descriptionOnHoverHosting = () => {
$('.event-card-status-circle-hosting').hover(function() {
    $('#popup').show();
}, function() {
    $('#popup').hide();
});
}

const descriptionOnHoverAccepted = () => {
$('.event-card-status-circle-accepted').hover(function() {
    $('#popup').show();
}, function() {
    $('#popup').hide();
});
}

const descriptionOnHoverPending = () => {
$('.event-card-status-circle-pending').hover(function() {
    $('#popup').show();
}, function() {
    $('#popup').hide();
});
}

export { collapseDayBoxes };
export { descriptionOnHoverHosting };
export { descriptionOnHoverAccepted };
export { descriptionOnHoverPending };
