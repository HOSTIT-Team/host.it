import { fetchWithToken } from "../utils/fetch_with_token";

const invitationAjax = () => {
  const newInvitationForm = document.querySelector("#new_invitation");
  const receiverEmailInput = document.querySelector(
    "#invitation_receiver_email"
  );
  const invitations = document.querySelector(".invitations");
  const action = newInvitationForm.attributes[3].value;

  if (newInvitationForm) {
    newInvitationForm.addEventListener("submit", (event) => {
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
          const invitation = data.invitation;
          const newInvitation = `
            <div class="invitee">
              <div class="receiver-avatar">?</div>
              <div class="invitee-info">
                ${invitation.receiver_email}
              </div>
              <div class="invitee-status">
                <div class="invitation-status-pending">Pending</div>
              </div>
              <div class="invite-delete">
                <a title="Delete invitation" rel="nofollow" data-method="delete" href="/invitations/${invitation.id}">
                  <i class="far fa-trash-alt"></i>
                </a>
            </div>
            </div>`;

          invitations.insertAdjacentHTML("afterbegin", newInvitation);
        });
    });
  }

  const inviteDeleteButtons = document.querySelectorAll(".invite-delete a");

  inviteDeleteButtons.forEach((deleteButton) => {
    deleteButton.addEventListener("click", () => {
      const inviteId = deleteButton.dataset.invitationId;
      const invitee = document.querySelector(`#invitation-${inviteId}`);
      invitee.remove();
    });
  });
};

export { invitationAjax };
