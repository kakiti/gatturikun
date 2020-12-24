function checked(){
  const checks = document.querySelectorAll(".check_box");
  const taskNew = document.getElementById("task-new-id");
  const userId = taskNew.getAttribute("data-id");
  checks.forEach(function(check) {
    if (check.getAttribute("data-load") != null) {
      return null;
    }
    check.setAttribute("data-load", "true");
    check.addEventListener("click", () => {
      const parent = check.parentElement
      const ancestor = parent.parentElement
      const checkId = ancestor.getAttribute("data-id")
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/users/${userId}/tasks/${checkId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          return null;          
        }
        const item = XHR.response.task;
        if (item.check === true) {
          check.setAttribute("checked", "true");
        } else if (item.check === false) {
          check.setAttribute("checked", "false");
        }
      };
    });
  });
};

setInterval(checked, 1000);