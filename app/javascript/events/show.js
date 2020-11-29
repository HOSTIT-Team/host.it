const inviteModal = () => {
 const openList = document.querySelector(".list-button")
 const closeList = document.querySelector("#close-button")
 const modal = document.querySelector(".invite-modal")

 if (openList) {
  openList.addEventListener("click", (event) => {
    event.preventDefault();
    modal.style.display = "flex";
  });
  closeList.addEventListener("click", () => {
    modal.style.display = "none";
  });
 }
};

const copyLink = () => {

    const copyText = document.querySelector(".event-url");
    const copyButton = document.querySelector(".event-url-copy");
    
    
    copyButton.addEventListener("click", () => {
      navigator.clipboard.writeText(copyText.innerHTML);
      copyButton.innerHTML = "Link copied!";
    });
    
    copyButton.addEventListener("mouseout", () => {
      copyButton.innerHTML = "Copy link";
    })
}

export { inviteModal, copyLink };