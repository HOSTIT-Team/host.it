const collapseDayBoxes = () => {

  var coll = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      
      if (content.style.display === "flex") {
        content.style.display = "none";
      } else {
        content.style.display = "flex";
      }
    });
  }
}

const circlePopup = () => {
  const circles = document.querySelectorAll(".circle")
  circles.forEach((circle) => {
    circle.addEventListener("mouseover", (event) => {
      event.currentTarget.children[0].classList.toggle("d-none");
    });
  });
};


export { collapseDayBoxes };
export { circlePopup };
