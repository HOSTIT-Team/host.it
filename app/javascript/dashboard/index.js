const collapseDayBoxes = () => {
  var coll = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
      this.classList.toggle("active");
      var content = this.nextElementSibling;

      if (content.style.display === "flex") {
        content.style.display = "none";
      } else {
        content.style.display = "flex";
      }
    });
  }

  const accept = document.querySelectorAll(".dashboard-accept");
  const decline = document.querySelectorAll(".dashboard-decline");

  if(accept) {
    accept.forEach(button => {
      button.addEventListener("click", event => {
        const cardStatus = event.currentTarget.parentElement.parentElement.querySelector(".event-card-pending");
        const circle = cardStatus.querySelector(".event-card-status-circle-pending");
        console.log(cardStatus);
        cardStatus.classList.remove("event-card-pending");
        cardStatus.classList.add("event-card-accepted");
        circle.classList.remove("event-card-status-circle-pending");
        circle.classList.remove("pulsate-fwd");
        circle.classList.remove("circle");
        circle.classList.add("event-card-status-circle-accepted");
      })
    })
  }

  if(decline) {
    decline.forEach(button => {
      button.addEventListener("click", event => {
        const cardStatus = event.currentTarget.parentElement.parentElement;
        console.log(cardStatus);
        cardStatus.remove();
      })
    })
  }
};

const circlePopup = () => {
  const circles = document.querySelectorAll(".circle");
  circles.forEach((circle) => {
    circle.addEventListener("mouseover", (event) => {
      event.currentTarget.children[0].classList.toggle("d-none");
    });
  });
};

export { collapseDayBoxes };
export { circlePopup };
