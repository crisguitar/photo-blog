function openModal(img) {
  var modal = document.getElementById('gallery-modal');
  var modalImg = document.getElementById("img01");
  var captionText = document.getElementById("caption");
  modal.style.display = "block";
  modalImg.src = img.src;
  captionText.innerHTML = img.alt;
}
var span = document.getElementById("close-modal");

span.onclick = function() {
  var modal = document.getElementById('gallery-modal');
  modal.style.display = "none";
}
