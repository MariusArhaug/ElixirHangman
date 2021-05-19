import HangmanSocket from "./hangman_socket.js";
window.onload = () => {
  const hangmanSocket = new HangmanSocket();
  hangmanSocket.connect_to_hangman();
}