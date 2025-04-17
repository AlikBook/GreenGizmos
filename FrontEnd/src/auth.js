import mitt from "mitt";

const emitter = mitt();

export const auth = {
  emitter,
  login() {
    emitter.emit("auth-change", true);
  },
  logout() {
    emitter.emit("auth-change", false);
  }
};
