function table(){
  const menbers = document.querySelectorAll(".menber-table-td-tr");
  const clients = document.querySelectorAll(".client-table-td-tr")
  menbers.forEach(function (menber) {
    menber.addEventListener("click", function(){
      const menberId = menber.getAttribute("data-id");
      location.href = `/users/${menberId}`;
    });
  });
  clients.forEach(function(client) {
    client.addEventListener("click", function(){
      const clientId = client.getAttribute("data-id");
      location.href = `/clients/${clientId}`;
    });
  });
};

window.addEventListener('load', table);