import { fetchWithToken } from "../utils/fetch_with_token";

const invitationAjax = () => {
  const newInvitationForm = document.querySelector("#new_invitation");
  const receiverEmailInput = document.querySelector(
    "#invitation_receiver_email"
  );
  const action = newInvitationForm.attributes[3].value;

  if (newInvitationForm) {
    newInvitationForm.addEventListener("submit", (event) => {
      // console.log(event);
      // console.log(newInvitationForm);
      // console.log(newInvitationForm.attributes);
      event.preventDefault();

      fetchWithToken(action, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          invitation: { receiver_email: receiverEmailInput.value },
        }),
      })
        .then((response) => response.json())
        .then((data) => {
          // handle JSON response from server
          console.log(data);
        });
    });
  }
};

export { invitationAjax };
