var section = document.getElementsByClassName('add_section')[0];

section.addEventListener('click', (e) => {
  e.preventDefault();

  var newNode = document.createElement('div');
  var container = document.getElementById('sections-container');
  newNode.innerHTML = e.target.dataset.fields;

  container.after(newNode);
});
