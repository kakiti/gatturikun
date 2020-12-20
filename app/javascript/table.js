function table(){
  const colums = document.querySelectorAll(".menber-table-td-tr");
  const path = document.getElementById("menber-path");
  colums.forEach(function (colum) {
    colum.addEventListener("click", function(){
      const columId = colum.getAttribute("data-id");
      location.href = `/users/${columId}`;
    });
  });
};

window.addEventListener('load', table);