function table(){
  const menbers = document.querySelectorAll(".menber-table-td-tr");
  menbers.forEach(function (menber) {
    colum.addEventListener("click", function(){
      const menberId = menber.getAttribute("data-id");
      location.href = `/users/${menberId}`;
    });
  });
};

window.addEventListener('load', table);