const inviteModal = () => {
 const openList = document.querySelector(".list-button")
 const closeList = document.querySelector("#close-button")
 const modal = document.querySelector(".invite-modal")

 if (openList) {
  openList.addEventListener("click", (event) => {
    console.log("button clicked")
    event.preventDefault();
    modal.style.display = "flex";
  });
  closeList.addEventListener("click", () => {
    modal.style.display = "none";
  });
 }
};

export { inviteModal };