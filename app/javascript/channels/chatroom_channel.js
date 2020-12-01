import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.querySelector('.chat-box');
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const input = document.querySelector("#chat-input");
        input.value = "";
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
  }
}

export { initChatroomCable };