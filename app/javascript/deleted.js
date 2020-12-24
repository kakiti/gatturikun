function deleted() {
  const destroys = document.querySelectorAll(".task-destroy-btn");
  destroys.forEach(function (destroy) {
    destroy.addEventListener("click", () => {
      const deleteDiv = destroy.parentElement
      const task = deleteDiv.parentElement
      task.remove();
    });
  });
};
setInterval(deleted, 1000);