import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.querySelector('.chat-box');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log("at least i am here")
    console.log(id)
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initChatroomCable };