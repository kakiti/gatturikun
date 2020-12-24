function task(){
  const submit = document.getElementById("add-submit");
  const taskNew = document.getElementById("task-new-id");
  const userId = taskNew.getAttribute("data-id");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("post", `/users/${userId}/tasks`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const formText = document.getElementById("content");
      if (formText.value == "") {
        return null;
      };
      const item = XHR.response.task;
      const table = document.getElementById('task-table-id');
      const newRow = table.insertRow(-1);
      newRow.classList.add("task-table-td-tr")
      newRow.setAttribute("data-id", `${item.id}`)
      const newCell1 = newRow.insertCell(0);
      newCell1.classList.add("task-table-td")
      const newCell2 = newRow.insertCell(1);
      newCell2.classList.add("task-table-td")
      const newCell3 = newRow.insertCell(2);
      newCell3.classList.add("task-table-td")
      newCell1.innerHTML = `
        <input class="check_box" type="checkbox" value="true" name="task[check]" id="task_check">
      `;
      newCell2.innerHTML = `
        <div> ${item.content} </div>
      `;
      newCell3.innerHTML = `
        <a class="task-destroy-btn" data-remote="true" rel="nofollow" data-method="delete" href="/users/${userId}/tasks/${item.id}">削除</a>
      `;
      formText.value = "";
    };
    e.preventDefault();
  });

}

window.addEventListener("load", task);